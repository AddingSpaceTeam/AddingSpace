# TODO: rewrite it into one SparseMat structure that uses
# https://hforsten.com/in-place-sparse-matrix-conversion-algorithm.html

type
  CooTriplet* = object
    row*, col*: int32
    value*: float32

  CscMat* = object
    data: seq[float32]
    indices: seq[int32]
    indptr: seq[int32]

proc toCsc*(mat: seq[CooTriplet], numRows, numCols: int32): CscMat =
  # port of https://github.com/eaymerich/Sparse2015/blob/4c9db801eb2840f256ce7763752ef079c84e4d54/code/csc.h#L163
  # Init mem for CSR matrix
  result = CscMat(
    data: newSeq[float32](mat.len),
    indices: newSeq[int32](mat.len),
    indptr: newSeq[int32](numCols + 1)
  )

  # Copy elements row by row
  var tot: int32 = 0
  result.indptr[0] = tot
  for i in 0..<numCols:
    while tot < mat.len and mat[tot].col == i:
      result.data[tot] = mat[tot].value
      result.indices[tot] = mat[tot].row
      inc tot

    result.indptr[i + 1] = tot
