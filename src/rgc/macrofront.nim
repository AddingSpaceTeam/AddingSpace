## Compile dsl to rgir
import ir, sem, bitabs
import std/[macros, macrocache]

const mcRgirCode = CacheSeq"rgc.rgirCode" # generated rgirCode

proc getSignature(n: NimNode, signature: var seq[string]) =
  case n.kind
  of nnkCommand:
    signature.add n[0].strVal
    getSignature(n[1], signature)
  of nnkIdent:
    signature.add n.strVal
  else:
    raiseAssert "Invalid signature"

type
  Modifier = enum
    No
    Dyn
    Pub
    Name
  
  ScopeKind = enum
    Toplevel
    Inner
  
  IrBuilder = object
    dest: Builder
    passType: string
    currentScopeName: string
    currentScopeKind: ScopeKind # ?maybe in the future it become Scope object

proc parseSignature(b: var Builder, n: NimNode): string =
  var signature: seq[string] = @[]
  n.getSignature(signature)
  var reached = No
  var modifiers: set[Modifier] = {}
  var name: string = ""
  for modifier in signature:
    # TODO: make it works on reverted seq and make 
    # invalid modifier error instead of "Only one name allowed"
    case modifier
    of "dyn":
      if reached >= Dyn: raiseAssert "Invalid `dyn` usage"
      reached = Dyn
      modifiers.incl Dyn
    of "pub":
      if reached >= Pub: raiseAssert "Invalid `pub` usage"
      reached = Pub
      modifiers.incl Pub
    else:
      if reached == Name: raiseAssert "Only one name allowed"
      reached = Name
      modifiers.incl Name
      name = modifier

  if Name notin modifiers: raiseAssert "Specify the name"

  b.addSymbolDef name
  
  if Dyn in modifiers: b.addIdent "dyn"
  else: b.addEmpty()
  
  if Pub in modifiers: b.addIdent "pub"
  else: b.addEmpty()

  name

proc mangleName(b: IrBuilder; name: string): string =
  if b.currentScopeName.len == 0:
    raiseAssert "Missing owner scope for local symbol"
  b.currentScopeName & "." & name

proc parseCommand(b: var IrBuilder, n: NimNode) =
  # TODO: add check for scope
  assert n.kind == nnkCommand
  case n[0].strVal
  of "input", "output":
    assert b.currentScopeKind == Toplevel
    b.dest.withTree n[0].strVal:
      b.dest.addSymbolDef b.mangleName(n[1].strVal)
      var s = n[2]
      assert s.kind == nnkStmtList # StmtList produced by `:`
      assert s.len == 1

      case s[0].kind
      of nnkBracketExpr:
        b.dest.addIdent s[0][0].strVal
        b.dest.addIdent s[0][1].strVal # TODO: in fact it can be some tree...
      of nnkIdent:
        b.dest.addIdent s[0].strVal
        b.dest.addEmpty()
      else: raiseAssert "Unsupported node kind in input/output command"
  of "shader":
    assert b.currentScopeKind == Inner
    b.dest.withTree "shader":
      b.dest.addIdent "fragment"
      b.dest.addIdent n[1].strVal # TODO: add CacheTable registry for actual const symbols

  of "use":
    assert b.currentScopeKind == Toplevel
    b.dest.withTree "use":
      b.dest.addEmpty()
      # TODO: add b.dest.addSymUse b.mangleName(n[1].strVal)

  else: raiseAssert "Invalid command"

proc parseStmt(b: var IrBuilder, n: NimNode)

proc parseCall(b: var IrBuilder, n: NimNode) =
  assert n.kind == nnkCall
  case n[0].strVal
  of "raster":
    inc b.currentScopeKind # TODO: normal scope object
    b.passType = "render" # TODO: move passType into scope with kind "PassDesc" or better name
    for i in n[1]: parseStmt(b, i)
    dec b.currentScopeKind

  else: discard

proc parseStmt(b: var IrBuilder, n: NimNode) =
  case n.kind
  of nnkCommand: parseCommand(b, n)
  of nnkCall: parseCall(b, n)
  else: discard

proc passOrModule*(signature: NimNode, code: NimNode, node: string) =
  var b = openBuilder()
  
  b.withTree node:
    let passName = b.parseSignature(signature) # TODO: it should init Scope object
    var stmts = IrBuilder(
      dest: openBuilder(),
      currentScopeName: passName,
      currentScopeKind: Toplevel)

    stmts.dest.withTree "stmts":
      for i in code:
        parseStmt(stmts, i)

    if stmts.passType.len == 0: b.addEmpty()
    else: b.addIdent stmts.passType
    b.addBuilder(stmts.dest)

  # echo b.extract()
  # echo treeRepr(code)
  mcRgirCode.add newStrLitNode(b.extract())

macro pass*(signature: untyped, code: untyped) =
  passOrModule(signature, code, "pass")

macro module*(signature: untyped, code: untyped) =
  passOrModule(signature, code, "module")

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
  semcheck(sem, beginRead(buf))


when isMainModule:
  pass pub mypass:
    input  src: Image[RGBA16F]
    output dst: Image[RGBA16F]

    raster:
      shader lightingShader
  
  module myModule:
    use mypass

  initGraph(myModule)
