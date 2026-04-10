## Compile dsl to rgir
{.experimental: "dynamicBindSym".}
import ir, sem, semvm, bitabs, vkcodegen
import tagmodel/model
import std/[macros, macrocache, tables, strutils]

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

proc emitUsage(b: var Builder, pragmas: NimNode) =
  assert pragmas.kind == nnkPragma and pragmas.len > 0
  # TODO: base usage is bad, it should not be positional
  # but I am too lazy ahahahhhha
  b.withTree "usage":
    let base = pragmas[0]
    case base.kind
    of nnkIdent:
      b.addIdent base.strVal
      b.addEmpty()
    of nnkCall:
      let name = base[0].strVal
      b.addIdent name
      case name
      of "colorAttachment":
        b.withTree "color":
          for i in 1 ..< base.len:
            b.emitNumLit base[i]
      of "depthAttachment":
        if base.len > 1: b.emitNumLit base[1]
        else: b.addEmpty()
      else: b.addEmpty()
    else:
      raiseAssert "Unsupported pragma kind: " & $base.kind

    # modifier pragmas:
    for i in 1 ..< pragmas.len:
      let m = pragmas[i]
      case m.kind
      of nnkIdent:
        b.addIdent m.strVal
      of nnkCall:
        b.addIdent m[0].strVal
        for j in 1 ..< m.len:
          case m[j].kind
          of nnkIdent: b.addIdent m[j].strVal
          of nnkIntLit, nnkFloatLit: b.emitNumLit m[j]
          else: raiseAssert "Unsupported modifier argument: " & $m[j].kind
      else: discard

proc identName(n: NimNode): string =
  case n.kind
  of nnkIdent: n.strVal
  of nnkSym: n.strVal
  of nnkOpenSymChoice, nnkClosedSymChoice: identName(n[0])
  else: raiseAssert "Expected identifier-like node, got: " & $n.kind

proc emitType(b: var Builder, n: NimNode) =
  case n.kind
  of nnkBracketExpr:
    let baseName = n[0].strVal
    let tag = if baseName in ["Image", "Buffer"]: baseName.toLowerAscii else: baseName
    b.withTree tag:
      for i in 1 ..< n.len:
        b.addIdent n[i].strVal
  of nnkCall:
    # should used when symbol already semchecked but idk
    # TODO: check that it possible and remove if it impossible
    let baseName = identName(n[1])
    let tag = if baseName in ["Image", "Buffer"]: baseName.toLowerAscii else: baseName
    b.withTree tag:
      for i in 2 ..< n.len:
        b.addIdent identName(n[i])
  of nnkIdent:
    case n.strVal
    of "Image":
      b.withTree "image": discard
    of "Buffer":
      b.withTree "buffer": discard
    else:
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
        assert pragma.kind == nnkPragma and pragma.len > 0,
               "Expected at least one usage pragma"
        b.dest.emitUsage pragma
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
  of "present":
    b.dest.withTree "present":
      b.dest.emitResourceRef n[1]
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

macro pass*(signature: untyped, code: untyped) =
  passOrModule(signature, code, "pass")

macro module*(signature: untyped, code: untyped) =
  let externalBase = mcExternal.len
  for s in code:
    if s.kind == nnkCommand and s[0].strVal == "external":
      mcExternal.add s[1]
  passOrModule(signature, code, "module", externalBase)

macro initGraph*(name: untyped, runtime: untyped) =
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
  semcheck(sem, buf, name.strVal)

  var execCursor = beginRead(sem.dest)
  let executes = getExecutesVm(execCursor, sem.lit)
  endRead(sem.dest)

  var extCursor = beginRead(sem.dest)
  var externals = getExternalsVm(extCursor, sem.lit)
  endRead(sem.dest)

  echo ""
  echo "Execute map:"
  for sym, body in executes:
    echo "  ", sem.lit.syms[sym], ": ", body.repr

  echo ""
  echo "External map:"
  for sym, node in externals:
    echo "  ", sem.lit.syms[sym], ": ", node.repr

  genCode(sem, executes, externals, runtime)

when isMainModule:
  import pkg/vulkan

  var
    swapchain = default(RgcExternalImage)
    cb = default(VkCommandBuffer)
    runtime = default(RgcRuntime)

  runtime.cb = cb
  runtime.width = 1920
  runtime.height = 1080
  swapchain.layout = Undefined

  pass raster shadowPass:
    output depth1 {.depthAttachment.}: Image[D32F, FullScreen]
    execute proc(cb: VkCommandBuffer) =
      discard

  pass raster pub forwardPass:
    input shadowMap {.sampled.}: Image[D32F, FullScreen]
    output color {.colorAttachment(1.0, 0.6, 0.2, 1.0), resolveAttachment(avg), samples(4).}: Image[RGBA16F, FullScreen]
    output depth {.depthAttachment, resolveAttachment(sample0), samples(4).}: Image[D32F, FullScreen]
    execute proc(cb: VkCommandBuffer) =
      discard

  module myModule:
    external swapchain: Image[RGBA16F, FullScreen]
    use shadowPass
    use forwardPass
    connect shadowPass.depth1, forwardPass.shadowMap
    connect forwardPass.color, swapchain

  initGraph(myModule, runtime)
