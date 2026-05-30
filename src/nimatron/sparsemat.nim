# TODO: rewrite it into one SparseMat structure that uses
# https://hforsten.com/in-place-sparse-matrix-conversion-algorithm.html
import pkg/nimsuperlu
import std/algorithm

# don't works if set --d:nimsuperlu.idxSize = 64
# because it uses int32 indices, if nimsuperlu will support generic code
# spacemat also will migrate to it

type
  CooTriplet* = object
    row*, col*: int32
    value*: float32

  CscMat* = object
    data*: seq[float32]
    indices*: seq[int32]
    indptr*: seq[int32]

proc toCsc*(
    mat: seq[CooTriplet],
    sorted: static bool = false): CscMat =
  ## Converts COO matrix to CSC matrix
  # port of https://github.com/eaymerich/Sparse2015/blob/4c9db801eb2840f256ce7763752ef079c84e4d54/code/csc.h#L163
  # but with sorting and sum duplicates

  var mat = mat
  when not sorted:
    mat.sort do (a, b: CooTriplet) -> int:
      result = cmp(a.col, b.col)
      if result == 0:
        result = cmp(a.row, b.row)

  let numCols =
    if mat.len > 0: mat[^1].col + 1
    else: 0'i32

  # Init mem for CSC matrix
  result = CscMat(
    data: newSeqOfCap[float32](mat.len),
    indices: newSeqOfCap[int32](mat.len),
    indptr: newSeq[int32](numCols + 1)
  )

  # Copy elements column by column
  var tot: int32 = 0
  result.indptr[0] = tot
  for i in 0..<numCols:
    while tot < mat.len and mat[tot].col == i:
      if  tot > 0 and
          mat[tot-1].col == mat[tot].col and
          mat[tot-1].row == mat[tot].row:
        result.data[^1] += mat[tot].value
      else:
        result.data.add mat[tot].value
        result.indices.add mat[tot].row
      inc tot

    result.indptr[i + 1] = int32(result.indices.len)

proc solve*(A: CscMat, b: seq[float32]): seq[float32] =
  ## Solves Ax = b for sparse matrices, returns x
  var
    options = superlu_options_t()
    smA = SuperMatrix()
    smB = SuperMatrix()
    smL = SuperMatrix()
    smU = SuperMatrix()
    stat = SuperLUStat_t()
    info: int_t = 0
    perm_c = newSeq[intT](A.indptr.len - 1)
    perm_r = newSeq[intT](A.indptr.len - 1)

  set_default_options(options.addr)
  options.ColPerm = COLAMD.cint
  options.PrintStat = NO.cint

  sCreate_CompCol_Matrix(
    smA.addr, cint(A.indptr.len - 1), cint(A.indptr.len - 1), int_t(A.data.len),
    A.data[0].addr, A.indices[0].addr, A.indptr[0].addr,
    SLU_NC, SLU_S, SLU_GE)

  result = b
  sCreate_Dense_Matrix(
    smB.addr, intT(A.indptr.len - 1), intT(1),
    result[0].addr, intT(A.indptr.len - 1),
    SLU_DN, SLU_S, SLU_GE)

  StatInit(stat.addr)

  sgssv(
    options.addr, smA.addr, perm_c[0].addr, perm_r[0].addr,
    smL.addr, smU.addr, smB.addr, stat.addr, info.addr)

  if info != 0:
    raise newException(ValueError, "SuperLU sgssv failed with info=" & $info)

  Destroy_SuperMatrix_Store(smA.addr)
  Destroy_SuperMatrix_Store(smB.addr)
  Destroy_SuperNode_Matrix(smL.addr)
  Destroy_CompCol_Matrix(smU.addr)
  StatFree(stat.addr)

when isMainModule:
  let triplets = @[
    CooTriplet(row: 0, col: 0, value: 3.0'f32),
    CooTriplet(row: 0, col: 2, value: 1.0'f32),
    CooTriplet(row: 1, col: 1, value: 2.0'f32),
    CooTriplet(row: 2, col: 0, value: 1.0'f32),
    CooTriplet(row: 2, col: 2, value: 3.0'f32)]
  
  let A = toCsc(triplets)
  let b = @[4.0'f32, 2.0'f32, 4.0'f32]
  let x = solve(A, b)
  echo "x = ", x
  for i in 0 ..< 3:
    doAssert abs(x[i] - 1.0'f32) < 1e-6'f32
  echo "CORRECT"