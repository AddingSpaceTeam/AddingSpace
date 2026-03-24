import std/[hashes, tables]
import ir

type
  TypeId* = distinct uint32

proc `==`*(a, b: TypeId): bool {.borrow.}
proc hash*(x: TypeId): Hash {.borrow.}

const NoTypeId* = TypeId(0)

type
  TypeTable* = object
    index: Table[string, TypeId]
    names: seq[string]
  
  Types*[Vm: static bool] = object
    # same as nimony's DefaultTypes
    when Vm:
      mem*: VmTokenBuf
      decls*: Table[TypeId, VmCursor]
    else:
      mem*: RtTokenBuf
      decls*: Table[TypeId, RtCursor]
  
  VmTypes* = Types[true]
  RtTypes* = Types[false]

proc initTypes*(): RtTypes =
  Types[false](mem: createTokenBuf())

proc initTypesVm*(): VmTypes =
  Types[true](mem: createTokenBufVm())

proc len*(t: TypeTable): int {.inline.} = t.names.len

proc typeToCanon*(buf: TokenBuf; start: int): string =
  ## Adapted from nimony's typeToCanon.
  result = ""
  for i in start..<buf.len:
    case buf[i].kind
    of ParLe:
      result.add '('
      result.addInt buf[i].tagId.int
    of ParRi: result.add ')'
    of Ident, StringLit:
      result.add ' '
      result.addInt buf[i].litId.int
    of EofToken: result.add " eof"
    of DotToken: result.add '.'
    of Symbol, SymbolDef:
      result.add " s"
      result.addInt buf[i].symId.int
    of IntLit:
      result.add " i"
      result.addInt buf[i].intId.int

proc intern*(t: var TypeTable; buf: TokenBuf; start: int): TypeId =
  let key = typeToCanon(buf, start)
  result = t.index.getOrDefault(key, NoTypeId)
  if result.uint32 != 0: return
  result = TypeId(t.names.len + 1)
  t.names.add key
  t.index[key] = result

proc toString*(t: TypeTable; tid: TypeId): string =
  if tid == NoTypeId: "<no type>"
  else: t.names[tid.int - 1]

# XXX: maybe better make it a proc bound to SemContext?
proc getOrGenType*(
  typeTable: var TypeTable,
  typeRegistry: var Types,
  typ: Cursor, buf: var TokenBuf): TypeId =
  result = typeTable.intern(buf, buf.len)
  if result in typeRegistry.decls: return

  let regTypeStart = typeRegistry.mem.len
  typeRegistry.mem.addSubtree typ
  typeRegistry.decls[result] = typeRegistry.mem.cursorAt(regTypeStart)
  # buf.takeTree(n) # add type to dest
  #                 # XXX: it shouldn't be realy need but in other
  #                 # case there are error
  # c.resourceTypes[sym] = typId
  endRead(typeRegistry.mem) # TODO: check that it works for RtCursor/RtTokenBuf
                            # maybe it's a good scenario
  # in fact we can't just mutate and then freeze bacause we don't know types
  # until it completed, maybe we need can add pass for it like:
  # 1. collect typeRegistry.mem
  # 2. create cursors
  # 3. use it

