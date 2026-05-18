import pkg/vmath

type
  Bone* = ref object
    p0*: Vec3
    p1*: Vec3
    bones*: seq[Bone]

  Skeleton* = object
    bone*: Bone

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

proc inferWeightsBhw*(mesh: var SkinningVertices, skeleton: Skeleton) =
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

  discard

# proc inferWeightsBbw*(mesh: var SkinningMesh) =
#   # implements BBW (Bounded Biharmonic Weights)
