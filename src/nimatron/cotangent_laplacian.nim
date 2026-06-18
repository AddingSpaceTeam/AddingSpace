# SPDX-FileCopyrightText: 2026 AddingSpaceTeam
#
# SPDX-License-Identifier: MPL-2.0

import pkg/vmath
import sparsemat

type CotangentLaplacian* = object
  L*: seq[CooTriplet] # Σ_j (cot a_ij + cot b_ij)/2
  ai*: seq[float32] # a_i (vertex area)

proc cotangentLaplacian*[V: Vec2 or Vec3](pos: openArray[V], indices: openArray[uint32]): CotangentLaplacian =
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
    ai: newSeq[float32](pos.len)
  )
  # for first step we are finding cot sums: Σ_j (cot a_ij + cot b_ij)/2

  template contribute(corner, a, b: untyped) =
    let
      u = pos[a] - pos[corner]
      v = pos[b] - pos[corner]
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
    let twoArea =
      when V is Vec2:
        abs(cross(pos[j] - pos[i], pos[k] - pos[i]))
      else:
        length(cross(pos[j] - pos[i], pos[k] - pos[i]))

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
