import std/[deques, json, nativesockets, net, options]

type
  QmpError* = ref object of CatchableError
    class*, desc*: string

  QmpEvent* = object
    name*: string
    seconds*, microseconds*: int64
    data*: JsonNode

  QmpClient* = object
    sock: Socket
    nextId: int64
    events: Deque[QmpEvent]
    greetingNode: JsonNode
    capabilities: seq[string]

proc parseEvent(n: JsonNode): QmpEvent =
  result = QmpEvent(name: n{"event"}.getStr, data: n{"data"})
  let ts = n{"timestamp"}
  if ts != nil and ts.kind == JObject:
    result.seconds = ts{"seconds"}.getBiggestInt
    result.microseconds = ts{"microseconds"}.getBiggestInt

proc close*(c: var QmpClient) =
  if c.sock != nil:
    try: c.sock.close()
    except CatchableError: discard
    c.sock = nil
  c.nextId = 0
  c.events.clear()
  c.greetingNode = nil

proc `=destroy`(c: var QmpClient) =
  if c.sock != nil:
    try: c.sock.close()
    except CatchableError: discard

proc `=copy`(dest: var QmpClient; src: QmpClient) {.error:
  "QmpClient is move-only; borrow it via `var` or use `ensureMove`".}

proc initQmpClient*(capabilities: seq[string] = @[]): QmpClient =
  QmpClient(capabilities: capabilities)

proc recv(c: var QmpClient): JsonNode =
  var line = ""
  c.sock.readLine(line)
  if line.len == 0:
    raise QmpError(msg: "connection closed by peer")
  try: parseJson(line)
  except JsonParsingError as e:
    raise QmpError(msg: "invalid JSON from peer: " & e.msg)

proc rpc(c: var QmpClient; req: JsonNode): JsonNode =
  inc c.nextId
  let id = %c.nextId
  req["id"] = id
  c.sock.send($req & "\n")
  while true:
    let n = c.recv()
    if n.hasKey("event"):
      c.events.addLast parseEvent(n)
    elif n{"id"} == id:
      if n.hasKey("error"):
        let err = n["error"]
        let desc = err{"desc"}.getStr
        raise QmpError(msg: desc, class: err{"class"}.getStr, desc: desc)
      return n

proc handshake(c: var QmpClient) =
  c.greetingNode = c.recv()
  if c.greetingNode.kind != JObject or not c.greetingNode.hasKey("QMP"):
    raise QmpError(msg: "expected QMP greeting, got " & $c.greetingNode)
  var req = %*{"execute": "qmp_capabilities"}
  if c.capabilities.len > 0:
    req["arguments"] = %*{"enable": c.capabilities}
  discard c.rpc(req)

proc connectUnix*(c: var QmpClient; path: string) =
  when defined(windows):
    raise QmpError(msg: "Unix sockets unsupported on Windows")
  else:
    c.close()
    c.sock = newSocket(AF_UNIX, SOCK_STREAM, IPPROTO_IP)
    c.sock.connectUnix(path)
    c.handshake()

proc connectTcp*(c: var QmpClient; host: string; port: Port) =
  c.close()
  c.sock = newSocket()
  c.sock.connect(host, port)
  c.handshake()

proc greeting*(c: QmpClient): JsonNode =
  c.greetingNode

proc execute*(
    c: var QmpClient; command: string;
    arguments: JsonNode = nil): JsonNode =

  var req = %*{"execute": command}
  if arguments != nil and arguments.kind == JObject and arguments.len > 0:
    req["arguments"] = arguments
  let resp = c.rpc(req)

  if resp.hasKey("return"):
    resp["return"]
  else:
    newJNull()

proc pollEvent*(
    c: var QmpClient;
    timeoutMs = 0): Option[QmpEvent] =

  result = none(QmpEvent)
  if c.events.len > 0:
    return some c.events.popFirst()

  if not c.sock.hasDataBuffered():
    if timeoutMs == 0:
      return

    var fds = @[c.sock.getFd]
    if selectRead(fds, timeoutMs) == 0:
      return

  let n = c.recv()
  if n.hasKey("event"):
    some(parseEvent(n))
  else:
    none(QmpEvent)

proc poolEvents*(c: var QmpClient): seq[QmpEvent] =
  result = @[]
  while c.events.len > 0:
    result.add c.events.popFirst()

  while c.sock.hasDataBuffered():
    let n = c.recv()
    if n.hasKey("event"): result.add parseEvent(n)

