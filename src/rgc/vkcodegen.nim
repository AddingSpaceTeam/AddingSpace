import ir, sem, bitabs, types
import tagmodel/model
import std/[macros, tables]

type
  CodegenCtx = object
    lit: Literals
    executes: Table[SymId, NimNode]
    externals: Table[SymId, NimNode]
    graph: Table[Node, seq[Node]]
    sorted: seq[Node]
    resourceTypes: Table[SymId, TypeId]

proc symName(c: CodegenCtx, sym: SymId): string = c.lit.syms[sym]
proc identStr(c: CodegenCtx, n: VmCursor): string = c.lit.strings[n.litId]

proc genStmt(c: var CodegenCtx, n: var VmCursor): NimNode

proc genInput(c: var CodegenCtx, n: var VmCursor): NimNode =
  inc n # (input
  let sym = n.symId; inc n
  echo "    input: ", c.symName(sym)
  if n.stmtKind == UsageS:
    inc n # (usage
    echo "      usage: ", c.identStr(n); inc n
    skip n # clear args or .
    inc n # )
  else: inc n # .
  skip n # type
  inc n # )
  newStmtList()

proc genOutput(c: var CodegenCtx, n: var VmCursor): NimNode =
  inc n # (output
  let sym = n.symId; inc n
  echo "    output: ", c.symName(sym)
  if n.stmtKind == UsageS:
    inc n # (usage
    echo "      usage: ", c.identStr(n); inc n
    skip n # clear args or .
    inc n # )
  else: inc n # .
  skip n # type
  inc n # )
  newStmtList()

proc genPass(c: var CodegenCtx, n: var VmCursor): NimNode =
  inc n # (pass
  let sym = n.symId; inc n
  echo "  pass: ", c.symName(sym)
  inc n # dyn
  inc n # pub
  if n.kind == Ident: echo "    passKind: ", c.identStr(n)
  inc n # passKind
  if n.kind == IntLit and sym in c.executes:
    echo "    execute: ", c.executes[sym].repr
  inc n # executeIdx
  result = genStmt(c, n)
  inc n # )

proc genExternal(c: var CodegenCtx, n: var VmCursor): NimNode =
  inc n # (external
  let sym = n.symId; inc n
  inc n # index
  echo "    external: ", c.symName(sym), " -> ", c.externals[sym].repr
  skip n # type
  inc n # )
  newStmtList()

proc genUse(c: var CodegenCtx, n: var VmCursor): NimNode =
  inc n # (use
  echo "    use: ", c.symName(n.symId); inc n
  inc n # )
  newStmtList()

proc genConnect(c: var CodegenCtx, n: var VmCursor): NimNode =
  inc n # (connect
  let src = n.symId; inc n
  let dst = n.symId; inc n
  echo "    connect: ", c.symName(src), " -> ", c.symName(dst)
  inc n # )
  newStmtList()

proc genModule(c: var CodegenCtx, n: var VmCursor): NimNode =
  inc n # (module
  let sym = n.symId; inc n
  echo "  module: ", c.symName(sym)
  inc n # dyn
  inc n # pub
  inc n # passType
  inc n # executeIdx
  result = genStmt(c, n)
  inc n # )

proc genStmt(c: var CodegenCtx, n: var VmCursor): NimNode =
  case n.stmtKind
  of StmtsS:
    inc n
    result = newStmtList()
    while n.kind != ParRi:
      result.add genStmt(c, n)
    inc n
  of PassS: result = genPass(c, n)
  of ModuleS: result = genModule(c, n)
  of InputS: result = genInput(c, n)
  of OutputS: result = genOutput(c, n)
  of ExternalS: result = genExternal(c, n)
  of UseS: result = genUse(c, n)
  of ConnectS: result = genConnect(c, n)
  else:
    echo "    unknown stmt: ", n.stmtKind
    skip n
    result = newStmtList()

proc genCode*(sem: var SemContext[true],
              executes: Table[SymId, NimNode],
              externals: Table[SymId, NimNode]): NimNode =
  echo "\n=== CODEGEN ==="
  echo "Topological order:"
  for node in sem.sorted:
    echo "  ", node.kind, "(", sem.lit.syms[node.s], ")"

  var ctx = CodegenCtx(
    lit: sem.lit,
    executes: executes,
    externals: externals,
    graph: sem.graph,
    sorted: sem.sorted,
    resourceTypes: sem.resourceTypes)

  echo ""
  var cursor = beginRead(sem.dest)
  result = genStmt(ctx, cursor)
  endRead(sem.dest)

  echo "\nGenerated:"
  echo result.repr
  echo "=== END CODEGEN ==="
