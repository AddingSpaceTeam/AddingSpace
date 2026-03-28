import ir, bitabs
import tagmodel/model
import std/[macrocache, tables]

const mcExecute = CacheSeq"rgc.execute"
const mcExternal = CacheSeq"rgc.external"

proc getExecutesVm*(n: var VmCursor, lit: Literals): Table[SymId, NimNode] =
  result = initTable[SymId, NimNode]()
  assert n.stmtKind == StmtsS
  inc n # (stmts
  while n.kind != ParRi:
    if n.stmtKind == PassS:
      inc n # (pass
      let sym = n.symId
      inc n # :name
      inc n # dyn
      inc n # pub
      inc n # passKind
      if n.kind == IntLit:
        result[sym] = mcExecute[int lit.integers[n.intId]]
        inc n
      else:
        inc n # . (no execute)
      skip n # (stmts ...)
      inc n # )
    else:
      skip n
  inc n # )

proc getExternalsVm*(n: var VmCursor, lit: Literals): Table[SymId, NimNode] =
  result = initTable[SymId, NimNode]()
  assert n.stmtKind == StmtsS
  inc n # (stmts
  while n.kind != ParRi:
    if n.stmtKind == ModuleS:
      inc n # (module
      inc n # :name
      inc n # dyn
      inc n # pub
      inc n # passType
      inc n # executeIdx
      assert n.stmtKind == StmtsS
      inc n # (stmts
      while n.kind != ParRi:
        if n.stmtKind == ExternalS:
          inc n # (external
          let sym = n.symId
          inc n # :name
          let idx = int lit.integers[n.intId]
          inc n # index
          skip n # type
          inc n # )
          result[sym] = mcExternal[idx]
        else:
          skip n
      inc n # ) stmts
      inc n # ) module
    else:
      skip n
  inc n # )
