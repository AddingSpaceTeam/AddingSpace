import pkg/vmath
import std/sequtils

type
  BoneId* = distinct int
  Bone* = object
    p0*: Vec3
    p1*: Vec3
    parent*: BoneId

  Skeleton* = object
    bones*: seq[Bone]

  SkinningVertices = object
    # Vertex data that need for skinning (LBS)
    # because LBS need BoneIndices, BoneWeights, Position, Normal
    # We use SoA here instead of AoS.
    # why?
    # 1. Because we need only some parts for different things:
    #    for example inferWeights need boneIndices, boneWeights
    #    LBS need full SkinningVertex
    # 2. GLTF format have vertex array, remapping it to array of SkinningVetices
    #    is very expensive
    #
    # !important: code that uses SkinningVertices object should
    # use ensureMove whenever possible (likely happen for pos, normals)
    # when init 

    boneIndices: seq[Uvec4]
    boneWeights: seq[Vec4]
    pos: seq[Vec3]
    normal: seq[Vec3]

proc findNearestBone(p: Vec3, skeleton: Skeleton): (BoneId, Vec3) =
  # nearest bone + closest point on bone

  result = (BoneId(-1), vec3(0))
  var oldMin: float32 = float32.high

  for boneId in 0..<skeleton.bones.len:
    let bone = skeleton.bones[boneId]
    let delta = bone.p1 - bone.p0
    let t = clamp(dot(p - bone.p0, delta) / delta.lengthSq, 0.0, 1.0) # TODO: (important) test if delta = 0
    let closest = bone.p0 + delta * t
    let dSq = lengthSq(p - closest)

    if dSq < oldMin:
      result = (BoneId(boneId), closest)
      oldMin = dSq

type CooTriplet = object
  row, col: int32
  value: float32

type CotangentLaplacian* = object
  L: seq[CooTriplet] # Σ_j (cot a_ij + cot b_ij)/2
  ai: seq[float32] # a_i (vertex area)

proc cotangentLaplacian(mesh: var SkinningVertices, indices: seq[uint32]): CotangentLaplacian =
  ## Implements formula: (Δf)_i = (1/a_i) * Σ_j  (cot a_ij + cot b_ij)/2 * (f_i − f_j)
  ## (f) not included (it depending on function)
  ## Σ_j  (cot a_ij + cot b_ij)/2 returned as L
  ## a_i computed as ai
  # also Δ = M⁻¹ * L (M is diag a_i)

  # where a_i - Barycentric dual area - 1/3 * (sum of areas of all triangles containing vertex i)
  # for triangle ABC we can get cot via
  # cot(angle ABC) = dot(BA, BC) / |cross(BA, BC)|
  result = CotangentLaplacian(
    L: newSeqOfCap[CooTriplet](indices.len * 4), # don't tested but compiler should rewrite it into shl 2
    ai: newSeq[float32](mesh.pos.len)
  )
  # for first step we are finding cot sums: Σ_j (cot a_ij + cot b_ij)/2

  template contribute(corner, a, b: untyped) =
    let
      u = mesh.pos[a] - mesh.pos[corner]
      v = mesh.pos[b] - mesh.pos[corner]
      w = dot(u, v) * invFourArea

    result.L.add CooTriplet(row: int32(a), col: int32(b), value: -w)
    result.L.add CooTriplet(row: int32(b), col: int32(a), value: -w)
    result.L.add CooTriplet(row: int32(a), col: int32(a), value:  w)
    result.L.add CooTriplet(row: int32(b), col: int32(b), value:  w)


  for t in 0..<indices.len div 3:
    # NOTE: we uses triangles (TRIANGLE), for TRIANGLE_FAN or TRIANGLE_STRIP
    # you need conversion
    let i = indices[3*t]
    let j = indices[3*t + 1]
    let k = indices[3*t + 2]
    let twoArea = length(cross(mesh.pos[j] - mesh.pos[i], mesh.pos[k] - mesh.pos[i]))
    if twoArea < 1e-5'f32: continue # I don't realy know correct coefficent, fp math is broken
    # barycentric vertex area: a_i = (1/3) Σ triArea
    let vertexArea = twoArea * static(0.5'f32 / 3.0'f32)
    result.ai[i] += vertexArea
    result.ai[j] += vertexArea
    result.ai[k] += vertexArea

    let invFourArea = 0.5'f32 / twoArea
    contribute(i, j, k)
    contribute(j, k, i)
    contribute(k, i, j)

proc inferWeightsBhw*(mesh: var SkinningVertices, skeleton: Skeleton, c = 1.0) =
  #[
  automatic Weights like in blender, trying to compute
  bone weights for vertices using
  bone heat weighting
  how it works?
  for every bone (i) we need to solve
  (-Δ + H) w_i​ = H p_i​
  where w_i - weights that we want
  ∆ is the discrete surface Laplacian, calculated with the cotangent formula [Meyer et al. 2003]
  p_i is a vector with p_ij = 1 if the nearest bone to vertex j is i and p_ij = 0 otherwise

  H is the diagonal matrix with H_jj being the heat contribution weight of the nearest bone to vertex j
  Pinocchio uses H_jj = c/d(j)^2 if the shortest line segment from the vertex to the
  bone is contained in the character volume and H_jj = 0 if it is not.
  if we want formalize it simpler than paper:

  for i, j: vertices
  segment = [vertex(j), findClosestPoint(vertex(j), findNearestBone(j))]
  H = {
    0, if i != j
    c/[length(segment)]^2, if isSegmentInsideVolume(segment)
    0, otherwise
  }
  ]#

  var hDiag = newSeq[float32](mesh.pos.len)
  var rhs = newSeqWith(skeleton.bones.len, newSeq[float32](mesh.pos.len))

  for j in 0..<mesh.pos.len:
    let (nearestBone, closestPoint) = findNearestBone(mesh.pos[j], skeleton)
    hDiag[j] = c / lengthSq(mesh.pos[j] - closestPoint)
    rhs[int(nearestBone)][j] = hDiag[j] # optimization: no loop needed! (but with cost in memory)

  # collected: p_i, H

# proc inferWeightsBbw*(mesh: var SkinningMesh) =
#   # implements BBW (Bounded Biharmonic Weights)
