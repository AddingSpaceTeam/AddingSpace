import pkg/vmath

type
  BoneId* = distinct int
  Bone* = ref object
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
    rhs[nearestBone][j] = hDiag[j] # optimization: no loop needed! (but with cost in memory)

  # collected: p_i, H

# proc inferWeightsBbw*(mesh: var SkinningMesh) =
#   # implements BBW (Bounded Biharmonic Weights)
