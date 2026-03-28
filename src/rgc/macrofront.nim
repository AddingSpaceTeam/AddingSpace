## Compile dsl to rgir
{.experimental: "dynamicBindSym".}
import ir, sem, bitabs
import tagmodel/model
import std/[macros, macrocache, tables]

const mcRgirCode = CacheSeq"rgc.rgirCode" # generated rgirCode
const mcExecute = CacheSeq"rgc.execute" # execute bodies, indexed by int
const mcExternal = CacheSeq"rgc.external" # external resources

type
  Modifier = enum
    Dyn
    Pub

  IrBuilder = object
    dest: Builder
    executeIdx: int
    externalIdx: int

proc parseSignature(b: var Builder, n: NimNode, passType: var string) =
  var modifiers: set[Modifier] = {}
  var node = n
  while node.kind == nnkCommand:
    case node[0].strVal
    of "dyn":
      if Pub in modifiers: raiseAssert "Invalid order, expected: dyn pub name"
      if Dyn in modifiers: raiseAssert "Duplicate `dyn`"
      modifiers.incl Dyn
    of "pub":
      if Pub in modifiers: raiseAssert "Duplicate `pub`"
      modifiers.incl Pub
    of "raster":
      if passType.len > 0: raiseAssert "Duplicate pass type"
      passType = "render"
    of "compute":
      if passType.len > 0: raiseAssert "Duplicate pass type"
      passType = "compute"
    of "copy":
      if passType.len > 0: raiseAssert "Duplicate pass type"
      passType = "copy"
    else:
      raiseAssert "Unknown modifier: " & node[0].strVal
    node = node[1]
  assert node.kind == nnkIdent, "Specify the name"

  b.addSymbolDef node.strVal

  if Dyn in modifiers: b.addIdent "dyn"
  else: b.addEmpty()

  if Pub in modifiers: b.addIdent "pub"
  else: b.addEmpty()

proc emitResourceRef(b: var Builder, n: NimNode) =
  case n.kind
  of nnkIdent:
    b.addIdent n.strVal
  of nnkDotExpr:
    b.withTree "dot":
      b.addIdent n[0].strVal
      b.addIdent n[1].strVal
  else:
    raiseAssert "Expected identifier or dot expression in connect"

proc emitNumLit(b: var Builder, n: NimNode) =
  case n.kind
  of nnkIntLit: b.addStrLit $n.intVal
  of nnkFloatLit: b.addStrLit $n.floatVal
  else: raiseAssert "Expected numeric literal, got: " & $n.kind

proc emitUsage(b: var Builder, pragma: NimNode) =
  b.withTree "usage":
    case pragma.kind
    of nnkIdent:
      b.addIdent pragma.strVal
      b.addEmpty()
    of nnkCall:
      let name = pragma[0].strVal
      let argCount = pragma.len - 1
      b.addIdent name
      case name
      of "colorAttachment":
        if argCount == 4:
          b.withTree "color":
            for i in 1 .. 4:
              b.emitNumLit pragma[i]
        else:
          raiseAssert "colorAttachment expects 4 arguments (RGBA), got: " & $argCount
      of "depthAttachment":
        if argCount == 1: b.emitNumLit pragma[1]
        else:
          raiseAssert "depthAttachment expects 1 argument (depth clear), got: " & $argCount
      else:
        raiseAssert "This usage doesn't support call: " & name
    else:
      raiseAssert "Unsupported pragma kind: " & $pragma.kind

proc emitType(b: var Builder, n: NimNode) =
  case n.kind
  of nnkBracketExpr:
    b.withTree n[0].strVal:
      for i in 1 ..< n.len:
        b.addIdent n[i].strVal
  of nnkIdent:
    b.addIdent n.strVal
  else: raiseAssert "Unsupported type expression kind: " & $n.kind

proc parseCommand(b: var IrBuilder, n: NimNode) =
  assert n.kind == nnkCommand
  case n[0].strVal
  of "input", "output":
    b.dest.withTree n[0].strVal:
      var nameNode = n[1]
      if nameNode.kind == nnkPragmaExpr:
        # parse usage
        b.dest.addIdent nameNode[0].strVal
        let pragma = nameNode[1]
        assert pragma.kind == nnkPragma and
               pragma.len == 1,
               "Expected exactly one usage pragma"
        b.dest.emitUsage pragma[0]
      else:
        b.dest.addIdent nameNode.strVal
        b.dest.addEmpty() # no usage

      var s = n[2]
      assert s.kind == nnkStmtList
      assert s.len == 1
      b.dest.emitType s[0]
  of "execute":
    mcExecute.add n[1]
    b.executeIdx = mcExecute.len - 1
  of "external":
    b.dest.withTree "external":
      b.dest.addIdent n[1].strVal
      b.dest.addIntLit(int64 b.externalIdx)
      inc b.externalIdx
      var s = n[2]
      assert s.kind == nnkStmtList
      assert s.len == 1
      b.dest.emitType s[0]
  of "use":
    b.dest.withTree "use":
      b.dest.addIdent n[1].strVal
  of "connect":
    b.dest.withTree "connect":
      b.dest.emitResourceRef n[1]
      b.dest.emitResourceRef n[2]
  else: raiseAssert "Invalid command"

proc parseStmt(b: var IrBuilder, n: NimNode) =
  case n.kind
  of nnkCommand: parseCommand(b, n)
  else: discard

proc passOrModule*(signature: NimNode, code: NimNode, node: string, externalBase: int = 0) =
  var b = openBuilder()
  var passType = ""

  b.withTree node:
    b.parseSignature(signature, passType)
    var stmts = IrBuilder(dest: openBuilder(), executeIdx: -1, externalIdx: externalBase)

    stmts.dest.withTree "stmts":
      for i in code:
        parseStmt(stmts, i)

    if passType.len == 0: b.addEmpty()
    else: b.addIdent passType

    # XXX: maybe make something like (vmexecuteId INTLIT)
    if stmts.executeIdx >= 0: b.addIntLit(int64 stmts.executeIdx)
    else: b.addEmpty()

    b.addBuilder(stmts.dest)

  mcRgirCode.add newStrLitNode(b.extract())

proc getExecuteBody*(idx: int): NimNode = mcExecute[idx]
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

macro pass*(signature: untyped, code: untyped) =
  passOrModule(signature, code, "pass")

macro module*(signature: untyped, code: untyped) =
  let externalBase = mcExternal.len
  for s in code:
    if s.kind == nnkCommand and s[0].strVal == "external":
      mcExternal.add bindSym(s[1].strVal)
  passOrModule(signature, code, "module", externalBase)

macro initGraph*(name: untyped) =
  var lit = createLiterals()
  var buf = createTokenBufVm()
  var rgir = ""
  for i in mcRgirCode:
    echo "i: ", i
    rgir.add i.strVal
  
  # echo "RGIR DUMP: ", rgir
  buf.addParLe lit.tags.getOrIncl("stmts")
  parse(rgir, lit, buf)
  buf.addParRi() # end of stmts
  when defined(rgc.dumpParsedRgir):
    echo "RGIR:"
    echo beginRead(buf).toString(lit)

  var sem = SemContext[true](lit: lit)
  semcheck(sem, buf)

  var execCursor = beginRead(sem.dest)
  let executes = getExecutesVm(execCursor, sem.lit)
  endRead(sem.dest)

  var extCursor = beginRead(sem.dest)
  let externals = getExternalsVm(extCursor, sem.lit)
  endRead(sem.dest)

  echo ""
  echo "Execute map:"
  for sym, body in executes:
    echo "  ", sem.lit.syms[sym], ": ", body.repr

  echo ""
  echo "External map:"
  for sym, node in externals:
    echo "  ", sem.lit.syms[sym], ": ", node.repr


when isMainModule:
  var swapchain: int = 0
  var depthBuf: int = 0

  pass raster pub mypass:
    input src {.sampled.}: Image[RGBA16F, Fullscreen]
    output dst {.colorAttachment(1.0, 0.6, 0.2, 1.0).}: Image[RGBA16F]
    execute proc(cb: CommandBuffer) =
      discard

  module myModule:
    external swapchain: Image[RGBA16F]
    external depthBuf: Image[D32F]
    output result {.colorAttachment.}: Image[RGBA16F]
    use mypass
    connect mypass.dst, result

  initGraph(myModule)
