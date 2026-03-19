import ir, bitabs, lineinfos
import tagmodel/model
import std/tables

type
  NodeKind = enum
    Module
    Pass
    Resource
  
  Node = object
    kind: NodeKind
    s: SymId

  SemContext*[Vm: static bool] = object
    when Vm:
      dest: VmTokenBuf
    else:
      data: RtTokenBuf
    
    lit*: Literals

    graph*: Table[Node, seq[Node]]
    # node(module) Main
    #   <- node(pass) Render1
    # 
    # node(pass) Render1:
    #   <- node(resource) Image1
    #
    # node(resource) Image1:
    #   <- node(pass) Render2
    #
    # node(pass) Render2:
    #   -> node(resource) Image1

    # I.e we need to invert arrows (only one direction allowed):
    # node(pass) Render2:
    #   <- node(resource) Image1
    # to
    # node(resource) Image1:
    #   <- node(pass) Render2
    currentNode: Node
    currentPassKind: string # Currently I don't care about scopes
    exported*: Table[SymId, FileId] # exported node to it's file

proc passNode(s: SymId): Node = Node(kind: Pass, s: s)
proc moduleNode(s: SymId): Node = Node(kind: Module, s: s)
proc resourceNode(s: SymId): Node = Node(kind: Resource, s: s)

proc skipParRi*(n: var Cursor) =
  assert n.kind == ParRi
  inc n

proc semStmt*(c: var SemContext, n: var Cursor) =
  echo "STMT: ", n.toString(c.lit)
  echo n.stmtKind
  case n.stmtKind
  of PassS:
    inc n
    c.currentNode = passNode(n.symId)
    inc n
    assert n.kind == DotToken # dyn pass is not supported
    inc n
    if n.kind == Ident and c.lit.strings[n.litId] == "pub":
      c.exported[c.currentNode.s] = FileId(0) # dummy file currently. TODO: implement
    inc n
    c.currentPassKind = c.lit.strings[n.litID]
    inc n
    semStmt c, n
    skipParRi n
  of ModuleS:
    inc n
    c.currentNode = moduleNode(n.symId)
    inc n
    inc n
    inc n
    inc n
    semStmt c, n
    skipParRi n
  of StmtsS:
    inc n
    while n.kind != ParRi:
      semStmt c, n
    skipParRi n
  of InputS:
    inc n
    c.graph.mgetOrPut(c.currentNode, @[]).add resourceNode(n.symId)
    inc n
    inc n
    inc n
    skipParRi n # ParRi
    echo "Input"
  of OutputS:
    inc n
    c.graph.mgetOrPut(resourceNode(n.symId), @[]).add c.currentNode
    inc n
    inc n
    inc n
    skipParRi n
    echo "Output"
  of ShaderS:
    echo "Shader"
    skip n
  of UseS: skip n
  of NoStmt: raiseAssert"Holly fuck?"
  else: raiseAssert"Unsupported"

proc semcheck*(c: var SemContext, n: Cursor) =
  var n = n
  assert n.stmtKind == StmtsS
  semStmt c, n
  
  echo "Dependency graph:"
  template repr(n: Node): string =
    $n.kind & "(" & c.lit.syms[n.s] & ")"
  
  for k, v in c.graph.pairs:
    var s = k.repr
    for i in v:
      s.add "\n  <- " & i.repr    
    echo s
