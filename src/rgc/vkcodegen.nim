{.experimental: "dynamicBindSym".}
import ir, bitabs, types
import sem except `==`
import tagmodel/model
import pkg/vulkan
import pkg/gallonim
import std/[macros, genasts, tables, sets, strutils, enumutils, typetraits]

type
  UsageKind = enum
    ukNone = "none"
    ukColorAttachment = "colorAttachment"
    ukDepthAttachment = "depthAttachment"
    ukSampled = "sampled"
    ukStorage = "storage"
    ukTransferSrc = "transferSrc"
    ukTransferDst = "transferDst"

  AccessMode = enum
    amRead
    amWrite
    amReadWrite

  PassKind = enum
    pkRender = "render"
    pkCompute = "compute"
    pkCopy = "copy"

  ShaderDomain = enum
    sdNone
    sdFragment
    sdCompute

  ResourceKind = enum
    rkImage
    rkBuffer

  ResolveMode = enum
    rmDefault = "default"
    rmAverage = "avg"
    rmSample0 = "sample0"
    rmMin = "min"
    rmMax = "max"

  SamplePolicy* = enum
    spFlexible = "flexible"
    spExact = "exact"
    spAtLeast = "atLeast"
    spAtMost = "atMost"

  RgcAttachmentClass* = enum
    racColor
    racDepth

  RgcMsaaBackend* = enum
    rmbDisabled
    rmbExplicitUniform
    rmbRenderToSingleSampledExt

  RgcMsaaCapabilities* = object
    supportsRtssExt*: bool
    colorSampleCounts*: VkSampleCountFlags
    depthSampleCounts*: VkSampleCountFlags

  RgcAttachmentMsaaRequest* = object
    kind*: RgcAttachmentClass
    requestedSamples*: int
    policy*: SamplePolicy
    enableMsaaImgAccess*: bool
    external*: bool

  RgcPassMsaaPlan* = object
    backend*: RgcMsaaBackend
    rasterizationSamples*: VkSampleCountFlagBits
    attachmentSamples*: seq[VkSampleCountFlagBits]

  RgcImageDesc* = object
    flags*: VkImageCreateFlags
    format*: VkFormat
    usage*: VkImageUsageFlags
    aspectMask*: VkImageAspectFlags
    samples*: VkSampleCountFlagBits

  RgcBufferDesc* = object
    size*: VkDeviceSize
    usage*: VkBufferUsageFlags
    location*: MemoryLocation
    deviceAddress*: bool

  RgcManagedImage* = object
    image*: VkImage
    view*: VkImageView
    alloc*: Allocation
    width*: uint32
    height*: uint32
    desc*: RgcImageDesc

  RgcManagedBuffer* = object
    buffer*: VkBuffer
    alloc*: Allocation
    desc*: RgcBufferDesc

  RgcRuntime* = object
    cb*: VkCommandBuffer
    physicalDevice*: VkPhysicalDevice
    device*: VkDevice
    allocator*: PassthroughGpuAllocator[VulkanAllocModel]
    width*: int
    height*: int
    msaaCaps*: RgcMsaaCapabilities

  RgcExternalImage* = object
    image*: VkImage
    view*: VkImageView
    layout*: VkImageLayout

  RgcBoundImage* = object
    image*: VkImage
    view*: VkImageView
    aspectMask*: VkImageAspectFlags
    layout*: VkImageLayout

  RgcBoundBuffer* = object
    buffer*: VkBuffer

  AttachmentData = object
    case usage: UsageKind
    of ukColorAttachment:
      colorClear: array[4, float32]
    of ukDepthAttachment:
      depthClear: float32
    else:
      discard

  ResourceInfo = object
    sym: SymId
    access: AccessMode
    resolve: bool
    resolveMode: ResolveMode
    samplesCnt: int
    samplesPolicy: SamplePolicy
    enableMsaaImgAccess: bool
    attachment: AttachmentData

  PassInfo = object
    sym: SymId
    kind: PassKind
    inputs: seq[ResourceInfo]
    outputs: seq[ResourceInfo]

  ModuleInfo = object
    sym: SymId
    presents: seq[SymId]

  RootResourcePlan = object
    root: SymId
    members: seq[SymId]
    typeId: TypeId
    usages: set[UsageKind]
    externalSym: SymId
    mayUseRtss: bool

  ResourceState = object
    hasContents: bool
    layoutExpr: NimNode
    currentUsage: UsageKind
    currentAccess: AccessMode
    currentShaderDomain: ShaderDomain

  ResourceAccessInfo = object
    stages: seq[NimNode]
    accesses: seq[NimNode]
    layout: NimNode

  ResourceBinding = object
    view: NimNode
    image: NimNode
    format: NimNode
    aspect: NimNode
    buffer: NimNode
    layoutSlot: NimNode
    initialLayout: NimNode

  AttachmentMsaaRole = enum
    amrNone
    amrResolve

  AttachmentMsaaInfo = object
    role: AttachmentMsaaRole
    attachmentIdx: int # index in runtime plan's attachmentSamples
    sourceObj: NimNode
    sourceView: NimNode
    sourceImage: NimNode

  PassMsaaLayout = object
    anyResolve: bool
    plans: Table[SymId, AttachmentMsaaInfo]

  CodegenCtx = object
    lit: Literals
    executes: Table[SymId, NimNode]
    externals: Table[SymId, NimNode]
    graph: Table[Node, seq[Node]]
    sorted: seq[Node]
    reachable: HashSet[Node]
    runtime: NimNode
    resourceTypes: Table[SymId, TypeId]
    passes: Table[SymId, PassInfo]
    modules: Table[SymId, ModuleInfo]
    consumed: HashSet[SymId]
    bindings: Table[SymId, ResourceBinding]
    msaaLayouts: Table[SymId, PassMsaaLayout]
    rootResourcePlans: Table[SymId, RootResourcePlan]
    resourceStates: Table[SymId, ResourceState]
    resourceParents: Table[SymId, SymId]
    setup: NimNode

proc localSymName(c: CodegenCtx, sym: SymId): string =
  let
    name = c.lit.syms[sym]
    dot = name.rfind('.')

  if dot >= 0: name[dot + 1 .. ^1]
  else: name

proc enumBit[T: enum](val: T): NimNode =
  # it's actually a very convenient thing: 
  # simplifies writing code and improves safety
  # because the enum's purpose is checked immediately,
  # instead of waiting for generated code semcheck.
  newDotExpr(bindSym(name(T)), ident(symbolName(val)))

proc binding(c: CodegenCtx, sym: SymId): ResourceBinding =
  c.bindings.getOrDefault(sym)

proc bindingRef(c: var CodegenCtx, sym: SymId): var ResourceBinding =
  c.bindings.mgetOrPut(
    sym, ResourceBinding(initialLayout: enumBit(VkImageLayout.Undefined)))

proc findResourceRoot(c: CodegenCtx, sym: SymId): SymId =
  c.resourceParents.getOrDefault(sym, sym)

proc `==`(a, b: RgcImageDesc): bool =
  a.flags == b.flags and a.format == b.format and a.usage == b.usage and
    a.aspectMask == b.aspectMask and a.samples == b.samples

proc `==`(a, b: RgcBufferDesc): bool =
  a.size == b.size and a.usage == b.usage and a.location == b.location and
    a.deviceAddress == b.deviceAddress

proc accessWrites(access: AccessMode): bool =
  access in {amWrite, amReadWrite}

proc shaderDomain(kind: PassKind): ShaderDomain =
  case kind
  of pkRender: sdFragment
  of pkCompute: sdCompute
  of pkCopy: sdNone

const RgcResolveSamples* = VK_SAMPLE_COUNT_4_BIT
const DefaultRequestedResolveSamples = 4

proc requireVkSuccess(res: VkResult, op: string) =
  if res != VkSuccess:
    # TODO: refactor it...
    quit(op & " failed: " & $res)

proc rgcDestroyManagedImage*(
    device: VkDevice,
    allocator: var PassthroughGpuAllocator[VulkanAllocModel],
    img: var RgcManagedImage) =
  vkDestroyImageView(device, img.view, nil)
  vkDestroyImage(device, img.image, nil)
  allocator.free(img.alloc)
  img = default(RgcManagedImage)

proc rgcEnsureManagedImage*(
    device: VkDevice,
    allocator: var PassthroughGpuAllocator[VulkanAllocModel],
    img: var RgcManagedImage,
    desc: RgcImageDesc,
    width, height: int) =
  if (
    img.width == width.uint32 and
    img.height == height.uint32 and
    img.desc == desc): return

  rgcDestroyManagedImage(device, allocator, img)

  var imageCi = VkImageCreateInfo(
    sType: ImageCreateInfo,
    flags: desc.flags,
    imageType: VK_IMAGE_TYPE_2D,
    format: desc.format,
    extent: VkExtent3D(width: width.uint32, height: height.uint32, depth: 1),
    mipLevels: 1,
    arrayLayers: 1,
    samples: desc.samples,
    tiling: VK_IMAGE_TILING_OPTIMAL,
    usage: desc.usage,
    initialLayout: VK_IMAGE_LAYOUT_UNDEFINED)

  vkCreateImage(
    device, imageCi.addr, nil, img.image.addr)
    .requireVkSuccess("vkCreateImage")

  var memReq = default(VkMemoryRequirements)
  vkGetImageMemoryRequirements(device, img.image, memReq.addr)
  img.alloc = allocator.alloc(
    AllocDesc(
      size: memReq.size.uint64,
      alignment: memReq.alignment.uint64,
      memoryTypeBits: memReq.memoryTypeBits,
      location: GpuOnly,
      linear: false))

  vkBindImageMemory(
    device,
    img.image,
    cast[VkDeviceMemory](img.alloc.handle),
    VkDeviceSize(img.alloc.offset))
    .requireVkSuccess("vkBindImageMemory")

  var viewCi = VkImageViewCreateInfo(
    sType: ImageViewCreateInfo,
    image: img.image,
    viewType: VK_IMAGE_VIEW_TYPE_2D,
    format: desc.format,
    subresourceRange:
      VkImageSubresourceRange(
        aspectMask: desc.aspectMask,
        levelCount: 1, layerCount: 1))

  vkCreateImageView(
    device, viewCi.addr, nil, img.view.addr)
    .requireVkSuccess("vkCreateImageView")

  img.desc = desc
  img.width = width.uint32
  img.height = height.uint32

proc rgcDestroyManagedBuffer*(
    device: VkDevice,
    allocator: var PassthroughGpuAllocator[VulkanAllocModel],
    buf: var RgcManagedBuffer) =
  vkDestroyBuffer(device, buf.buffer, nil)
  allocator.free(buf.alloc)
  buf = default(RgcManagedBuffer)

proc rgcEnsureManagedBuffer*(
    device: VkDevice,
    allocator: var PassthroughGpuAllocator[VulkanAllocModel],
    buf: var RgcManagedBuffer,
    desc: RgcBufferDesc) =
  if buf.desc == desc:
    return

  rgcDestroyManagedBuffer(device, allocator, buf)

  var bufferCi =
    VkBufferCreateInfo(sType: BufferCreateInfo, size: desc.size, usage: desc.usage)

  vkCreateBuffer(
    device, bufferCi.addr, nil, buf.buffer.addr)
    .requireVkSuccess("vkCreateBuffer")

  var memReq = default(VkMemoryRequirements)
  vkGetBufferMemoryRequirements(device, buf.buffer, memReq.addr)
  buf.alloc = allocator.alloc(
    AllocDesc(
      size: memReq.size.uint64,
      alignment: memReq.alignment.uint64,
      memoryTypeBits: memReq.memoryTypeBits,
      location: desc.location,
      linear: true,
      deviceAddress: desc.deviceAddress))

  vkBindBufferMemory(
    device,
    buf.buffer,
    cast[VkDeviceMemory](buf.alloc.handle),
    VkDeviceSize(buf.alloc.offset))
    .requireVkSuccess("vkBindBufferMemory")

  buf.desc = desc

proc sampleCountBit*(samples: int): VkSampleCountFlagBits =
  case samples
  of 1:  VK_SAMPLE_COUNT_1_BIT
  of 2:  VK_SAMPLE_COUNT_2_BIT
  of 4:  VK_SAMPLE_COUNT_4_BIT
  of 8:  VK_SAMPLE_COUNT_8_BIT
  of 16: VK_SAMPLE_COUNT_16_BIT
  of 32: VK_SAMPLE_COUNT_32_BIT
  of 64: VK_SAMPLE_COUNT_64_BIT
  else:
    raiseAssert "Unsupported sample count: " & $samples

proc sampleCountInt*(samples: VkSampleCountFlagBits): int =
  case samples
  of VK_SAMPLE_COUNT_1_BIT:  1
  of VK_SAMPLE_COUNT_2_BIT:  2
  of VK_SAMPLE_COUNT_4_BIT:  4
  of VK_SAMPLE_COUNT_8_BIT:  8
  of VK_SAMPLE_COUNT_16_BIT: 16
  of VK_SAMPLE_COUNT_32_BIT: 32
  of VK_SAMPLE_COUNT_64_BIT: 64

proc supportedSampleFlags(
    caps: RgcMsaaCapabilities,
    kind: RgcAttachmentClass): VkSampleCountFlags =
  case kind
  of racColor: caps.colorSampleCounts
  of racDepth: caps.depthSampleCounts

proc chooseUniformSampleCount*(
    requests: openArray[RgcAttachmentMsaaRequest], 
    caps: RgcMsaaCapabilities): int =
  var
    preferred = 1
    lower = 1
    upper = 64

  for request in requests:
    preferred = max(preferred, request.requestedSamples)
    let requested = request.requestedSamples
    if request.policy in {spExact, spAtLeast}:
      lower = max(lower, requested)
    if request.policy in {spExact, spAtMost}:
      upper = min(upper, requested)

  if lower > upper:
    raiseAssert "Unable to derive common sample count for raster pass"

  result = 0
  var bestDistance = int.high
  for candidate in [1, 2, 4, 8, 16, 32, 64]:
    if candidate notin lower .. upper:
      continue

    block checkSupport:
      for request in requests:
        if sampleCountBit(candidate) notin caps.supportedSampleFlags(request.kind):
          break checkSupport

      let distance = abs(candidate - preferred)
      if distance < bestDistance or (distance == bestDistance and candidate > result):
        result = candidate
        bestDistance = distance

  if result == 0:
    raiseAssert "No common sample count supported for raster pass"

proc canUseRtss(
    requests: openArray[RgcAttachmentMsaaRequest],
    uniformSamples: int,
    caps: RgcMsaaCapabilities): bool =
  if not caps.supportsRtssExt or uniformSamples <= 1:
    return false
  
  for request in requests:
    if request.enableMsaaImgAccess or request.external:
      return false
  
  true

proc rgcSelectPassMsaaPlan*(
    caps: RgcMsaaCapabilities,
    requests: openArray[RgcAttachmentMsaaRequest]): RgcPassMsaaPlan =
  result = RgcPassMsaaPlan(
    backend: rmbDisabled,
    rasterizationSamples: VK_SAMPLE_COUNT_1_BIT,
    attachmentSamples: newSeq[VkSampleCountFlagBits](requests.len),
  )

  let uniformSamples = chooseUniformSampleCount(requests, caps)
  result.rasterizationSamples = sampleCountBit(uniformSamples)
  for i in 0 ..< requests.len:
    result.attachmentSamples[i] = result.rasterizationSamples

  result.backend =
    if canUseRtss(requests, uniformSamples, caps):
      rmbRenderToSingleSampledExt
    elif uniformSamples <= 1:
      rmbDisabled
    else:
      rmbExplicitUniform

  for i, request in requests:
    if request.enableMsaaImgAccess and sampleCountInt(result.attachmentSamples[i]) <= 1:
      raiseAssert "enableMsaaImgAccess requires an effective multisampled image"

proc resourceDebugSuffix(resource: ResourceInfo): string =
  var extras: seq[string] = @[]
  if resource.resolve:
    extras.add "resolve=" & $resource.resolveMode
  if resource.samplesCnt > 1:
    extras.add "samples=" & $resource.samplesCnt
  if resource.samplesPolicy != spFlexible:
    extras.add "samplesPolicy=" & $resource.samplesPolicy
  if resource.enableMsaaImgAccess:
    extras.add "enableMsaaImgAccess"
  let extraSuffix =
    if extras.len > 0:
      " " & extras.join(" ")
    else:
      ""
  case resource.attachment.usage
  of ukColorAttachment:
    " clear=" & $resource.attachment.colorClear & extraSuffix
  of ukDepthAttachment:
    " depth=" & $resource.attachment.depthClear & extraSuffix
  else:
    extraSuffix

proc collectResource(c: CodegenCtx, n: var VmCursor, access: AccessMode): ResourceInfo =
  let sym = n.symId
  inc n
  var
    attachment = default(AttachmentData)
    resolve = false
    resolveMode = rmDefault
    samplesCnt = 1
    samplesPolicy = spFlexible
    enableMsaaImgAccess = false

  if n.stmtKind == UsageS:
    inc n # (usage
    let usage = parseEnum[UsageKind](c.lit.strings[n.litId], ukNone)
    inc n # name
    case usage
    of ukColorAttachment:
      attachment =
        AttachmentData(usage: ukColorAttachment, colorClear: [0'f32, 0, 0, 1])
      if n.exprKind == ColorE:
        inc n # (color
        for i in 0 .. 3:
          attachment.colorClear[i] = parseFloat(c.lit.strings[n.litId])
          inc n
        inc n # )
      else:
        skip n # .
    of ukDepthAttachment:
      attachment = AttachmentData(usage: ukDepthAttachment, depthClear: 1'f32)
      if n.kind == StringLit:
        attachment.depthClear = parseFloat(c.lit.strings[n.litId])
        inc n
      else:
        skip n # .
    else:
      attachment = AttachmentData(usage: usage)
      skip n # args or .
    while n.kind != ParRi:
      assert n.kind == Ident, "Expected usage modifier identifier"
      case c.lit.strings[n.litId]
      of "resolveAttachment":
        resolve = true
        samplesCnt = DefaultRequestedResolveSamples
        inc n
        if n.kind == Ident:
          resolveMode = parseEnum[ResolveMode](c.lit.strings[n.litId])
          inc n
      of "samples":
        inc n
        samplesCnt = parseInt(c.lit.strings[n.litId])
        inc n
      of "samplesPolicy":
        inc n
        samplesPolicy = parseEnum[SamplePolicy](c.lit.strings[n.litId])
        inc n
      of "enableMsaaImgAccess":
        enableMsaaImgAccess = true
        inc n
      else:
        assert false, "Unknown usage modifier: " & c.lit.strings[n.litId]
    inc n # ) usage
  else:
    inc n # .
  skip n # type

  ResourceInfo(
    sym: sym,
    access: access,
    resolve: resolve,
    resolveMode: resolveMode,
    samplesCnt: samplesCnt,
    samplesPolicy: samplesPolicy,
    enableMsaaImgAccess: enableMsaaImgAccess,
    attachment: attachment)

proc collectPass(c: var CodegenCtx, n: var VmCursor) =
  inc n # (pass
  if Node(kind: Pass, s: n.symId) notin c.reachable:
    # fast path for unreachable passes
    skipToEnd n
    return
  var info = PassInfo(sym: n.symId)
  inc n # :name
  inc n # dyn
  inc n # pub
  assert n.kind == Ident, "Expected pass kind identifier"
  info.kind = parseEnum[PassKind](c.lit.strings[n.litId])
  inc n # passKind
  inc n # executeIdx
  assert n.stmtKind == StmtsS
  inc n
  while n.kind != ParRi:
    let stmtKind = n.stmtKind
    case n.stmtKind
    of InputS, OutputS:
      let access = if stmtKind == InputS: amRead else: amWrite
      inc n
      let resource = c.collectResource(n, access)
      if stmtKind == InputS:
        info.inputs.add resource
      else:
        info.outputs.add resource
      inc n
    else:
      skip n
  inc n # ) stmts
  inc n # ) pass

  echo "  pass: ", c.lit.syms[info.sym], " [", info.kind, "]"
  for r in info.inputs:
    echo "    in  ", c.lit.syms[r.sym], " ", r.attachment.usage, "/", r.access
  for r in info.outputs:
    echo "    out ",
      c.lit.syms[r.sym], " ", r.attachment.usage, "/", r.access, resourceDebugSuffix(r)
  c.passes[info.sym] = info

proc collectModule(c: var CodegenCtx, n: var VmCursor) =
  inc n # (module
  if Node(kind: Module, s: n.symId) notin c.reachable:
    # fast path for unreachable passes
    skipToEnd n
    return
  var info = ModuleInfo(sym: n.symId)
  echo "  module: ", c.lit.syms[info.sym]
  inc n # :name
  inc n # dyn
  inc n # pub
  inc n # passType
  inc n # executeIdx
  inc n # (stmts
  while n.kind != ParRi:
    case n.stmtKind
    of ExternalS:
      inc n # (external
      let sym = n.symId
      inc n # :name
      inc n # index
      skip n # type
      inc n # )
      if sym in c.externals:
        echo "    external: ", c.lit.syms[sym], " [bound]"
    of ConnectS:
      inc n # (connect
      let src = n.symId
      inc n # :src
      let dst = n.symId
      inc n # :dst
      inc n # )
      c.consumed.incl src
      echo "    connect: ",
        c.lit.syms[src],
        " -> ",
        c.lit.syms[dst],
        (if src in c.bindings or dst in c.bindings: " [linked]" else: " [pending]")
    of PresentS:
      inc n # (present
      info.presents.add n.symId
      echo "    present: ", c.lit.syms[n.symId]
      inc n # :sym
      inc n # )
    of OutputS:
      inc n # (output
      discard c.collectResource(n, amWrite)
      inc n # )
    of UseS:
      inc n # (use
      inc n # :sym
      inc n # )
    else:
      skip n
  inc n # ) stmts
  inc n # ) module
  c.modules[info.sym] = info

proc collect(c: var CodegenCtx, n: var VmCursor) =
  assert n.stmtKind == StmtsS
  inc n
  while n.kind != ParRi:
    case n.stmtKind
    of PassS:
      c.collectPass(n)
    of ModuleS:
      c.collectModule(n)
    else:
      skip n
  inc n

proc shaderStageFor(domain: ShaderDomain): NimNode =
  case domain
  of sdCompute:
    enumBit(VkPipelineStageFlagBits2.ComputeShaderBit)
  of sdFragment:
    enumBit(VkPipelineStageFlagBits2.FragmentShaderBit)
  of sdNone:
    raiseAssert "Shader resource access requires a render or compute pass"

proc resourceAccessInfo(
    usage: UsageKind, access: AccessMode,
    shaderDomain: ShaderDomain): ResourceAccessInfo =
  result = ResourceAccessInfo(layout: enumBit(VkImageLayout.Undefined))
  case usage
  of ukColorAttachment:
    result.stages = @[enumBit(VkPipelineStageFlagBits2.ColorAttachmentOutputBit)]
    result.layout = enumBit(AttachmentOptimal)
    result.accesses =
      case access
      of amRead:
        @[enumBit(VkAccessFlagBits2.ColorAttachmentReadBit)]
      of amWrite:
        @[enumBit(VkAccessFlagBits2.ColorAttachmentWriteBit)]
      of amReadWrite:
        @[
          enumBit(VkAccessFlagBits2.ColorAttachmentReadBit),
          enumBit(VkAccessFlagBits2.ColorAttachmentWriteBit),
        ]
  of ukDepthAttachment:
    result.stages = @[
      enumBit(VkPipelineStageFlagBits2.EarlyFragmentTestsBit),
      enumBit(VkPipelineStageFlagBits2.LateFragmentTestsBit),
    ]
    result.layout = enumBit(AttachmentOptimal)
    result.accesses =
      case access
      of amRead:
        @[enumBit(VkAccessFlagBits2.DepthStencilAttachmentReadBit)]
      of amWrite:
        @[enumBit(VkAccessFlagBits2.DepthStencilAttachmentWriteBit)]
      of amReadWrite:
        @[
          enumBit(VkAccessFlagBits2.DepthStencilAttachmentReadBit),
          enumBit(VkAccessFlagBits2.DepthStencilAttachmentWriteBit),
        ]
  of ukSampled:
    result.stages = @[shaderStageFor(shaderDomain)]
    result.accesses = @[enumBit(VkAccessFlagBits2.ShaderReadBit)]
    result.layout = enumBit(ShaderReadOnlyOptimal)
  of ukStorage:
    result.stages = @[shaderStageFor(shaderDomain)]
    result.layout = enumBit(VkImageLayout.General)
    result.accesses =
      case access
      of amRead:
        @[enumBit(VkAccessFlagBits2.ShaderReadBit)]
      of amWrite:
        @[enumBit(VkAccessFlagBits2.ShaderWriteBit)]
      of amReadWrite:
        @[
          enumBit(VkAccessFlagBits2.ShaderReadBit),
          enumBit(VkAccessFlagBits2.ShaderWriteBit),
        ]
  of ukTransferSrc:
    result.stages = @[enumBit(VkPipelineStageFlagBits2.AllTransferBit)]
    result.accesses = @[enumBit(VkAccessFlagBits2.TransferReadBit)]
    result.layout = enumBit(TransferSrcOptimal)
  of ukTransferDst:
    result.stages = @[enumBit(VkPipelineStageFlagBits2.AllTransferBit)]
    result.accesses = @[enumBit(VkAccessFlagBits2.TransferWriteBit)]
    result.layout = enumBit(TransferDstOptimal)
  of ukNone: discard

proc presentAccessInfo(): ResourceAccessInfo =
  ResourceAccessInfo(
    stages: @[enumBit(VkPipelineStageFlagBits2.BottomOfPipeBit)],
    accesses: @[],
    layout: enumBit(PresentSrcKhr))

proc emptyAccessInfo(): ResourceAccessInfo =
  ResourceAccessInfo(
    stages: @[], accesses: @[],
    layout: enumBit(VkImageLayout.Undefined))

proc attachmentResolveMode(resource: ResourceInfo): NimNode =
  case resource.attachment.usage
  of ukColorAttachment:
    case resource.resolveMode
    of rmDefault, rmAverage:
      enumBit(VkResolveModeFlagBits.AverageBit)
    else:
      raiseAssert "colorAttachment resolveAttachment mode must be avg"
  of ukDepthAttachment:
    case resource.resolveMode
    of rmDefault, rmSample0:
      enumBit(VkResolveModeFlagBits.SampleZeroBit)
    of rmMin:
      enumBit(VkResolveModeFlagBits.MinBit)
    of rmMax:
      enumBit(VkResolveModeFlagBits.MaxBit)
    else:
      raiseAssert "depthAttachment resolveAttachment mode must be sample0, min, or max"
  else:
    raiseAssert "Resolve mode is only valid for attachment usages"

proc objConstr(typeSym: NimNode, fields: openArray[(string, NimNode)]): NimNode =
  result = newNimNode(nnkObjConstr)
  result.add typeSym
  for (name, value) in fields:
    result.add newColonExpr(ident name, value)

proc ifExpr(cond, yesExpr, noExpr: NimNode): NimNode =
  genAst(cond, yesExpr, noExpr):
    if cond: yesExpr else: noExpr

proc arrayVar(body: NimNode, sym: NimNode, items: openArray[NimNode]) =
  var arrayNode = newNimNode(nnkBracket)
  for item in items:
    arrayNode.add item
  body.add newVarStmt(sym, arrayNode)

proc curlyFlags(typeSym: NimNode, flags: seq[NimNode]): NimNode =
  ## equivalent to VkEnum{flag1, flag2, ...}.
  if flags.len == 0:
    return newCall(typeSym, newLit(0))
  var pack = newNimNode(nnkBracket)
  for f in flags:
    pack.add newCall(bindSym"uint32", f)
  result = newCall(typeSym, nestList(bindSym"or", pack))

proc buildImageBarrier(
    image, aspectMask, oldLayout: NimNode,
    srcInfo, dstInfo: ResourceAccessInfo): NimNode =
  genAst(
    srcStage = curlyFlags(bindSym"VkPipelineStageFlags2", srcInfo.stages),
    srcAccess = curlyFlags(bindSym"VkAccessFlags2", srcInfo.accesses),
    dstStage = curlyFlags(bindSym"VkPipelineStageFlags2", dstInfo.stages),
    dstAccess = curlyFlags(bindSym"VkAccessFlags2", dstInfo.accesses),
    oldLayoutN = oldLayout,
    newLayoutN = dstInfo.layout,
    imageN = image,
    aspectMaskN = aspectMask): VkImageMemoryBarrier2(
      sType: ImageMemoryBarrier2,
      srcStageMask: srcStage,
      srcAccessMask: srcAccess,
      dstStageMask: dstStage,
      dstAccessMask: dstAccess,
      oldLayout: oldLayoutN,
      newLayout: newLayoutN,
      image: imageN,
      subresourceRange: VkImageSubresourceRange(
        aspectMask: aspectMaskN,
        levelCount: 1'u32, layerCount: 1'u32))

proc buildBufferBarrier(
    buffer: NimNode, srcInfo,
    dstInfo: ResourceAccessInfo): NimNode =
  genAst(
    srcStage = curlyFlags(bindSym"VkPipelineStageFlags2", srcInfo.stages),
    srcAccess = curlyFlags(bindSym"VkAccessFlags2", srcInfo.accesses),
    dstStage = curlyFlags(bindSym"VkPipelineStageFlags2", dstInfo.stages),
    dstAccess = curlyFlags(bindSym"VkAccessFlags2", dstInfo.accesses),
    bufferN = buffer): VkBufferMemoryBarrier2(
      sType: BufferMemoryBarrier2,
      srcStageMask: srcStage,
      srcAccessMask: srcAccess,
      dstStageMask: dstStage,
      dstAccessMask: dstAccess,
      buffer: bufferN,
      offset: VkDeviceSize(0'u64),
      size: VkDeviceSize(VkWholeSize),
    )

proc genAddr(n: NimNode): NimNode =
  nnkDotExpr.newTree(n, bindSym"addr")

proc genArrayAddr(arr: NimNode, idx: int = 0): NimNode =
  nnkDotExpr.newTree(nnkBracketExpr.newTree(arr, newLit(idx)), bindSym"addr")

proc newGlobalVarStmt(sym, typ: NimNode): NimNode =
  let initType =
    case typ.kind
    of nnkSym, nnkIdent:
      ident(typ.strVal)
    else:
      typ.copyNimTree
  genAst(s = sym, t = initType):
    var s {.global.} = default(t)

proc runtimeField(c: CodegenCtx, field: string): NimNode =
  newDotExpr(c.runtime.copyNimTree, ident(field))

proc stateFor(c: var CodegenCtx, sym: SymId): var ResourceState =
  let root = c.findResourceRoot(sym)
  var initial = ResourceState()
  let b = c.binding(root)
  initial.layoutExpr = b.initialLayout.copyNimTree
  c.resourceStates.mgetOrPut(root, initial)

proc resourceBindingExpr(c: var CodegenCtx, sym: SymId): NimNode =
  let b = c.binding(sym)
  if b.image != nil and b.aspect != nil:
    let state = c.stateFor(sym)
    return genAst(
      imageN = b.image.copyNimTree,
      viewN = b.view.copyNimTree,
      aspectMaskN = b.aspect.copyNimTree,
      layoutN = state.layoutExpr.copyNimTree):
      RgcBoundImage(
        image: imageN, view: viewN, aspectMask: aspectMaskN, layout: layoutN
      )
  if b.buffer != nil:
    return genAst(bufferN = b.buffer.copyNimTree):
      RgcBoundBuffer(buffer: bufferN)
  raiseAssert "Missing resource binding for execute: " & c.lit.syms[sym]

proc buildExecuteBindings(c: var CodegenCtx, info: PassInfo): NimNode =
  result = newStmtList()
  var emitted = initHashSet[SymId]()
  for resource in info.inputs:
    if resource.sym notin emitted:
      emitted.incl resource.sym
      result.add newLetStmt(
        ident(c.localSymName(resource.sym)), c.resourceBindingExpr(resource.sym)
      )
  for resource in info.outputs:
    if resource.sym notin emitted:
      emitted.incl resource.sym
      result.add newLetStmt(
        ident(c.localSymName(resource.sym)), c.resourceBindingExpr(resource.sym)
      )

proc imageNeedsBarrier(
    state: ResourceState, dstUsage: UsageKind,
    dstAccess: AccessMode): bool =
  state.currentUsage == ukNone or state.currentUsage != dstUsage or
    accessWrites(state.currentAccess) or accessWrites(dstAccess)

proc bufferNeedsBarrier(
    state: ResourceState, dstUsage: UsageKind,
    dstAccess: AccessMode): bool =
  state.currentUsage != ukNone and (
    state.currentUsage != dstUsage or accessWrites(state.currentAccess) or
    accessWrites(dstAccess))

proc transitionResource(
    c: var CodegenCtx,
    imageBarriers: var seq[NimNode],
    bufferBarriers: var seq[NimNode],
    updates: var seq[NimNode],
    sym: SymId,
    dstUsage: UsageKind,
    dstAccess: AccessMode,
    dstShaderDomain: ShaderDomain) =
  let
    state = c.stateFor(sym)
    b = c.binding(sym)
    isImage = b.image != nil and b.aspect != nil
    isBuffer = b.buffer != nil
    dstInfo = resourceAccessInfo(dstUsage, dstAccess, dstShaderDomain)
    srcInfo =
      if state.currentUsage != ukNone:
        resourceAccessInfo(
          state.currentUsage, state.currentAccess,
          state.currentShaderDomain)
      else: emptyAccessInfo()
    oldLayout = state.layoutExpr.copyNimTree

  if isImage and imageNeedsBarrier(state, dstUsage, dstAccess):
    imageBarriers.add buildImageBarrier(b.image, b.aspect, oldLayout, srcInfo, dstInfo)
    if b.layoutSlot != nil:
      updates.add newAssignment(b.layoutSlot, dstInfo.layout.copyNimTree)
  elif isBuffer and bufferNeedsBarrier(state, dstUsage, dstAccess):
    bufferBarriers.add buildBufferBarrier(b.buffer, srcInfo, dstInfo)

  # buffers have no layout, but images have
  state.layoutExpr = if isImage: dstInfo.layout.copyNimTree else: nil

  state.currentUsage = dstUsage
  state.currentAccess = dstAccess
  state.currentShaderDomain = dstShaderDomain

type ImageTypeSpec = object
  format: NimNode
  aspectFlags: seq[NimNode]

proc requireTypeDecl(sem: var SemContext[true], tid: TypeId): auto =
  if tid == TypeId(0) or tid notin sem.typeRegistry.decls:
    raiseAssert "Missing type information: " & $tid.uint32
  sem.typeRegistry.decls[tid]

proc typeIdToResourceKind(sem: var SemContext[true], tid: TypeId): ResourceKind =
  var n = sem.requireTypeDecl(tid)
  case n.typeKind
  of ImageT: rkImage
  of BufferT: rkBuffer
  else:
    raiseAssert "Unsupported resource type"

proc typeNodeToImageSpec(sem: var SemContext[true], tid: TypeId): ImageTypeSpec =
  var n = sem.requireTypeDecl(tid)
  inc n # (Image
  let formatName = sem.lit.strings[n.litId]
  inc n
  inc n # sizeName (unused)

  result =
    case formatName
    of "RGBA16F":
      ImageTypeSpec(
        format: enumBit(VkFormat.R16g16b16a16Sfloat),
        aspectFlags: @[enumBit(VkImageAspectFlagBits.ColorBit)])
    of "D32F":
      ImageTypeSpec(
        format: enumBit(VkFormat.D32Sfloat),
        aspectFlags: @[enumBit(VkImageAspectFlagBits.DepthBit)])
    of "D32FS8":
      ImageTypeSpec(
        format: enumBit(VkFormat.D32SfloatS8Uint),
        aspectFlags: @[enumBit(VkImageAspectFlagBits.DepthBit), enumBit(VkImageAspectFlagBits.StencilBit)])
    of "B8G8R8A8_SRGB":
      ImageTypeSpec(
        format: enumBit(VkFormat.B8g8r8a8Srgb),
        aspectFlags: @[enumBit(VkImageAspectFlagBits.ColorBit)])
    else:
      raiseAssert "Unsupported image format: " & formatName

proc usageImageFlags(usages: set[UsageKind]): seq[NimNode] =
  result = @[]
  # TODO: maybe there better way
  if ukColorAttachment in usages:
    result.add enumBit(VkImageUsageFlagBits.ColorAttachmentBit)
  if ukDepthAttachment in usages:
    result.add enumBit(VkImageUsageFlagBits.DepthStencilAttachmentBit)
  if ukSampled in usages:
    result.add enumBit(VkImageUsageFlagBits.SampledBit)
  if ukStorage in usages:
    result.add enumBit(VkImageUsageFlagBits.StorageBit)
  if ukTransferSrc in usages:
    result.add enumBit(VkImageUsageFlagBits.TransferSrcBit)
  if ukTransferDst in usages:
    result.add enumBit(VkImageUsageFlagBits.TransferDstBit)

proc ensureRootPlan(c: var CodegenCtx, root: SymId) =
  if root notin c.rootResourcePlans:
    c.rootResourcePlans[root] = RootResourcePlan(root: root, typeId: TypeId(0))

proc noteRootPlanSym(c: var CodegenCtx, sym: SymId) =
  let root = c.findResourceRoot(sym)
  c.ensureRootPlan(root)
  template plan(): auto =
    c.rootResourcePlans[root]

  if plan.typeId == TypeId(0):
    plan.typeId = c.resourceTypes.getOrDefault(sym, TypeId(0))
  if sym notin plan.members:
    plan.members.add(sym)
  if sym in c.externals:
    if plan.externalSym == SymId(0):
      plan.externalSym = sym

proc noteRootPlanUsage(c: var CodegenCtx, sym: SymId, usage: UsageKind) =
  if usage == ukNone: return
  let root = c.findResourceRoot(sym)
  c.ensureRootPlan(root)
  c.rootResourcePlans[root].usages.incl usage

proc buildRootResourcePlans(c: var CodegenCtx) =
  c.rootResourcePlans = initTable[SymId, RootResourcePlan]()

  for info in c.passes.values:
    for resource in info.inputs:
      c.noteRootPlanSym(resource.sym)
      c.noteRootPlanUsage(resource.sym, resource.attachment.usage)
    for resource in info.outputs:
      c.noteRootPlanSym(resource.sym)
      c.noteRootPlanUsage(resource.sym, resource.attachment.usage)

  for sym in c.externals.keys:
    c.noteRootPlanSym(sym)

  for root, plan in c.rootResourcePlans:
    if plan.typeId == TypeId(0):
      raiseAssert "Missing type information for root plan: " & c.lit.syms[root]

  for info in c.passes.values:
    for output in info.outputs:
      if
        output.resolve and output.samplesCnt > 1 and not output.enableMsaaImgAccess and
        c.rootResourcePlans.getOrDefault(
          c.findResourceRoot(output.sym)).externalSym ==
          SymId(0):
        let root = c.findResourceRoot(output.sym)
        if root in c.rootResourcePlans:
          c.rootResourcePlans[root].mayUseRtss = true

proc isExternalResource(c: CodegenCtx, sym: SymId): bool =
  c.rootResourcePlans.getOrDefault(c.findResourceRoot(sym)).externalSym != SymId(0)

proc bindImagePlan(
    c: var CodegenCtx,
    plan: RootResourcePlan,
    viewExpr, imageExpr, aspectExpr,
    formatExpr: NimNode) =
  for sym in plan.members:
    c.bindingRef(sym).view = viewExpr
    c.bindingRef(sym).image = imageExpr
    c.bindingRef(sym).aspect = aspectExpr
    c.bindingRef(sym).format = formatExpr

proc bindExternalImageLayout(
    c: var CodegenCtx, plan: RootResourcePlan,
    layoutExpr: NimNode) =
  for sym in plan.members:
    c.bindingRef(sym).initialLayout = layoutExpr
    c.bindingRef(sym).layoutSlot = layoutExpr

proc bindBufferPlan(c: var CodegenCtx, plan: RootResourcePlan, bufferExpr: NimNode) =
  for sym in plan.members:
    c.bindingRef(sym).buffer = bufferExpr

proc rasterAttachmentOutputs(info: PassInfo): seq[ResourceInfo] =
  result = @[]
  for output in info.outputs:
    if output.attachment.usage in {ukColorAttachment, ukDepthAttachment}:
      result.add output

proc analyzeAllPassMsaa(c: var CodegenCtx) =
  for sym, info in c.passes:
    if info.kind != pkRender:
      continue
    var layout = PassMsaaLayout()
    for i, output in info.rasterAttachmentOutputs:
      if not output.resolve:
        layout.plans[output.sym] = AttachmentMsaaInfo(role: amrNone, attachmentIdx: i)
        continue
      layout.anyResolve = true
      var mi = AttachmentMsaaInfo(role: amrResolve, attachmentIdx: i)
      let imageSym = genSym(nskVar, "rgcMsaaImage")
      c.setup.add newGlobalVarStmt(imageSym, bindSym"RgcManagedImage")
      mi.sourceObj = imageSym
      mi.sourceView = newDotExpr(imageSym, ident"view")
      mi.sourceImage = newDotExpr(imageSym, ident"image")
      layout.plans[output.sym] = mi
    c.msaaLayouts[sym] = layout

proc resolveImageGroup(
    c: var CodegenCtx, sem: var SemContext[true],
    plan: RootResourcePlan) =
  let
    imageSpec = sem.typeNodeToImageSpec(plan.typeId)
    aspectExpr = curlyFlags(bindSym"VkImageAspectFlags", imageSpec.aspectFlags)

  if plan.externalSym != SymId(0):
    let external = c.externals[plan.externalSym]
    c.bindImagePlan(
      plan,
      newDotExpr(external.copyNimTree, ident"view"),
      newDotExpr(external.copyNimTree, ident"image"),
      aspectExpr,
      imageSpec.format)
    c.bindExternalImageLayout(plan, newDotExpr(external.copyNimTree, ident"layout"))
    return

  let imageDesc = objConstr(
    bindSym"RgcImageDesc",
    [
      (
        "flags",
        if plan.mayUseRtss:
          ifExpr(
            newDotExpr(c.runtimeField("msaaCaps"), ident"supportsRtssExt"),
            curlyFlags(
              bindSym"VkImageCreateFlags",
              @[enumBit(VkImageCreateFlagBits.MultisampledRenderToSingleSampledBitExt)],
            ),
            newCall(bindSym"VkImageCreateFlags", newLit(0)),
          )
        else:
          newCall(bindSym"VkImageCreateFlags", newLit(0)),
      ),
      ("format", imageSpec.format),
      ("usage", curlyFlags(bindSym"VkImageUsageFlags", usageImageFlags(plan.usages))),
      ("aspectMask", aspectExpr.copyNimTree),
      ("samples", bindSym"VK_SAMPLE_COUNT_1_BIT")])
  let imageSym = genSym(nskVar, "rgcImage")
  c.setup.add newGlobalVarStmt(imageSym, bindSym"RgcManagedImage")
  c.setup.add newCall(
    bindSym"rgcEnsureManagedImage",
    c.runtimeField("device"),
    c.runtimeField("allocator"),
    imageSym,
    imageDesc,
    c.runtimeField("width"),
    c.runtimeField("height"))
  c.bindImagePlan(
    plan,
    newDotExpr(imageSym, ident"view"),
    newDotExpr(imageSym, ident"image"),
    aspectExpr,
    imageSpec.format)

proc resolveBufferGroup(c: var CodegenCtx, plan: RootResourcePlan) =
  if plan.externalSym != SymId(0):
    c.bindBufferPlan(plan, c.externals[plan.externalSym].copyNimTree)
    return

  raiseAssert "Internal Buffer resources are not supported yet; declare them external until sized buffer types exist: " &
    c.lit.syms[plan.root]

proc resolveResourceViews(c: var CodegenCtx, sem: var SemContext[true]) =
  c.buildRootResourcePlans()

  for plan in c.rootResourcePlans.values:
    case sem.typeIdToResourceKind(plan.typeId)
    of rkImage: c.resolveImageGroup(sem, plan)
    of rkBuffer: c.resolveBufferGroup(plan)

  c.analyzeAllPassMsaa()

proc genResourceBarriers(c: var CodegenCtx, info: PassInfo): NimNode =
  result = newStmtList()
  var
    imageBarriers: seq[NimNode] = @[]
    bufferBarriers: seq[NimNode] = @[]
    layoutUpdates: seq[NimNode] = @[]

  for input in info.inputs:
    let
      state = c.stateFor(input.sym)
      prevUsage = state.currentUsage
      prevAccess = state.currentAccess

    c.transitionResource(
      imageBarriers,
      bufferBarriers,
      layoutUpdates,
      input.sym,
      input.attachment.usage,
      input.access,
      shaderDomain(info.kind))

    let beforeLen = imageBarriers.len + bufferBarriers.len
    if imageBarriers.len + bufferBarriers.len > beforeLen:
      var debugMsg = "    barrier: "
      if prevUsage != ukNone:
        debugMsg.add $prevUsage & "/" & $prevAccess
      else:
        debugMsg.add "initial"
      debugMsg.add " -> "
      debugMsg.add $input.attachment.usage & "/" & $input.access
      echo debugMsg

  for output in info.outputs:
    let
      state = c.stateFor(output.sym)
      prevUsage = state.currentUsage
      prevAccess = state.currentAccess

    c.transitionResource(
      imageBarriers,
      bufferBarriers,
      layoutUpdates,
      output.sym,
      output.attachment.usage,
      output.access,
      shaderDomain(info.kind))

    let beforeLen = imageBarriers.len + bufferBarriers.len
    if imageBarriers.len + bufferBarriers.len > beforeLen:
      var debugMsg = "    barrier: "
      if prevUsage != ukNone:
        debugMsg.add $prevUsage & "/" & $prevAccess
      else:
        debugMsg.add "initial"
      debugMsg.add " -> "
      debugMsg.add $output.attachment.usage & "/" & $output.access
      echo debugMsg

  let
    hasImageBarriers = imageBarriers.len > 0
    hasBufferBarriers = bufferBarriers.len > 0

  if not hasImageBarriers and not hasBufferBarriers: return

  let
    imageBarriersSym = genSym(nskVar, "rgcImageBarriers")
    bufferBarriersSym = genSym(nskVar, "rgcBufferBarriers")
    depInfoSym = genSym(nskVar, "rgcDepInfo")

  if hasImageBarriers: # TODO: maybe refactor into sets
    result.arrayVar(imageBarriersSym, imageBarriers)
  if hasBufferBarriers:
    result.arrayVar(bufferBarriersSym, bufferBarriers)

  var depFields: seq[(string, NimNode)] = @[("sType", bindSym"DependencyInfo")]

  if hasImageBarriers:
    depFields.add (
      "imageMemoryBarrierCount",
      newCall(bindSym"uint32", newDotExpr(imageBarriersSym, bindSym"len")))

    depFields.add ("pImageMemoryBarriers", genArrayAddr(imageBarriersSym))

  if hasBufferBarriers:
    depFields.add (
      "bufferMemoryBarrierCount",
      newCall(bindSym"uint32", newDotExpr(bufferBarriersSym, bindSym"len")))

    depFields.add ("pBufferMemoryBarriers", genArrayAddr(bufferBarriersSym))

  result.add newVarStmt(depInfoSym, objConstr(bindSym"VkDependencyInfo", depFields))
  result.add newCall(
    bindSym"vkCmdPipelineBarrier2", c.runtimeField("cb"),
    genAddr(depInfoSym))

  for update in layoutUpdates:
    result.add update

proc attachmentClassExpr(usage: UsageKind): NimNode =
  case usage
  of ukColorAttachment: bindSym"racColor"
  of ukDepthAttachment: bindSym"racDepth"
  else:
    raiseAssert "MSAA planning only applies to attachment usages"

proc buildPassMsaaPlanExpr(c: var CodegenCtx, info: PassInfo): NimNode =
  var requests = newNimNode(nnkBracket)
  for output in info.rasterAttachmentOutputs:
    requests.add objConstr(
      bindSym"RgcAttachmentMsaaRequest",
      [
        ("kind", attachmentClassExpr(output.attachment.usage)),
        ("requestedSamples", newLit(if output.resolve: output.samplesCnt else: 1)),
        (
          "policy",
          if output.resolve:
            bindSym(symbolName(output.samplesPolicy))
          else:
            bindSym"spExact",
        ),
        ("enableMsaaImgAccess", newLit(output.enableMsaaImgAccess)),
        ("external", newLit(c.isExternalResource(output.sym)))
      ])
  newCall(bindSym"rgcSelectPassMsaaPlan", c.runtimeField("msaaCaps"), requests)

proc msaaAttachmentSampleIntExpr(planSym: NimNode, idx: int): NimNode =
  newCall(
    bindSym"sampleCountInt",
    nnkBracketExpr.newTree(
      newDotExpr(planSym.copyNimTree, ident"attachmentSamples"),
      newLit(idx)))

proc msaaPlanUsesRtssExpr(planSym: NimNode): NimNode =
  infix(
    newDotExpr(planSym.copyNimTree, ident"backend"),
    "==",
    bindSym"rmbRenderToSingleSampledExt")

proc msaaPlanUsesExplicitSourceExpr(planSym: NimNode, idx: int): NimNode =
  infix(
    prefix(msaaPlanUsesRtssExpr(planSym), "not"),
    "and",
    infix(msaaAttachmentSampleIntExpr(planSym, idx), ">", newLit(1)))

proc buildMsaaSourceDesc(
    c: var CodegenCtx, output: ResourceInfo,
    sampleExpr: NimNode): NimNode =
  let
    b = c.binding(output.sym)
    usageExpr =
      curlyFlags(bindSym"VkImageUsageFlags", usageImageFlags({output.attachment.usage}))
    formatN = b.format.copyNimTree
    aspectMaskN = b.aspect.copyNimTree
    samplesN = newCall(bindSym"sampleCountBit", sampleExpr)

  genAst(formatN, usageExpr, aspectMaskN, samplesN):
    RgcImageDesc(
      flags: VkImageCreateFlags(0),
      format: formatN,
      usage: usageExpr,
      aspectMask: aspectMaskN,
      samples: samplesN)

proc genAttachmentInfo(
    imageViewExpr, resolveModeExpr, resolveImageViewExpr,
    loadOpExpr, storeOpExpr, clearValueExpr: NimNode): NimNode =
  genAst(
    imageViewN = imageViewExpr,
    resolveModeN = resolveModeExpr,
    resolveImageViewN = resolveImageViewExpr,
    loadOpN = loadOpExpr,
    storeOpN = storeOpExpr,
    clearValueN = clearValueExpr): VkRenderingAttachmentInfo(
      sType: RenderingAttachmentInfo,
      imageView: imageViewN,
      imageLayout: AttachmentOptimal,
      resolveMode: resolveModeN,
      resolveImageView: resolveImageViewN,
      resolveImageLayout: AttachmentOptimal,
      loadOp: loadOpN,
      storeOp: storeOpN,
      clearValue: clearValueN,
    )

proc genExecuteTemplate(execNode: NimNode, name: NimNode, prelude: NimNode): NimNode =
  result = newNimNode(nnkTemplateDef, execNode)
  result.add name
  # skip routine name and body
  for i in 1 ..< execNode.len - 1:
    result.add execNode[i].copyNimTree
  let body = newStmtList()
  prelude.copyChildrenTo(body)
  execNode[^1].copyChildrenTo(body)
  result.add body

proc addExecuteCall(
    c: var CodegenCtx, body: NimNode,
    info: PassInfo, runtimeCb: NimNode) =
  if info.sym in c.executes:
    let executeTemplateSym = genSym(nskTemplate, "rgcExecute")
    let bindings = c.buildExecuteBindings(info)
    body.add genExecuteTemplate(c.executes[info.sym], executeTemplateSym, bindings)
    body.add newCall(executeTemplateSym, runtimeCb.copyNimTree)

proc genRasterPass(c: var CodegenCtx, info: PassInfo): NimNode =
  let
    runtimeCb = c.runtimeField("cb")
    msaa = c.msaaLayouts.getOrDefault(info.sym)

  var body = newStmtList()
  let planSym = genSym(nskLet, "rgcMsaaPlan")
  body.add newLetStmt(planSym, c.buildPassMsaaPlanExpr(info))
  var loadOps = initTable[SymId, NimNode]()
  for output in info.outputs:
    let
      directLoadOp =
        if c.stateFor(output.sym).hasContents:
          bindSym("Load", brOpen)
        else:
          bindSym("Clear", brOpen)
      mi = msaa.plans.getOrDefault(output.sym)

    loadOps[output.sym] =
      if mi.role == amrResolve:
        ifExpr(
          msaaPlanUsesExplicitSourceExpr(planSym, mi.attachmentIdx),
          bindSym("Clear", brOpen),
          directLoadOp)
      else: directLoadOp

  body.add c.genResourceBarriers(info)

  for output in info.outputs:
    let mi = msaa.plans.getOrDefault(output.sym)
    if mi.role != amrResolve: continue

    let
      imageSym = mi.sourceObj.copyNimTree
      ensureCond = msaaPlanUsesExplicitSourceExpr(planSym, mi.attachmentIdx)
      descExpr = c.buildMsaaSourceDesc(
        output, msaaAttachmentSampleIntExpr(planSym, mi.attachmentIdx))
      dstInfo =
        resourceAccessInfo(output.attachment.usage, amWrite, shaderDomain(info.kind))
      b = c.binding(output.sym)
      barrierInit = buildImageBarrier(
        mi.sourceImage,
        b.aspect,
        enumBit(VkImageLayout.Undefined),
        emptyAccessInfo(),
        dstInfo)

    body.add genAst(
        ensureCondN = ensureCond,
        imageSym,
        descExpr,
        barrierInit,
        deviceN = c.runtimeField("device"),
        allocatorN = c.runtimeField("allocator"),
        widthN = c.runtimeField("width"),
        heightN = c.runtimeField("height"),
        cbN = c.runtimeField("cb")) do:
      if ensureCondN:
        rgcEnsureManagedImage(deviceN, allocatorN, imageSym, descExpr, widthN, heightN)
        var barrier = barrierInit
        var depInfo = VkDependencyInfo(
          sType: DependencyInfo,
          imageMemoryBarrierCount: 1'u32,
          pImageMemoryBarriers: barrier.addr,
        )
        vkCmdPipelineBarrier2(cbN, depInfo.addr)
      else:
        rgcDestroyManagedImage(deviceN, allocatorN, imageSym)

  type AttachmentKind = enum
    ColorAttachment
    DepthAttachment

  var
    colorAtts: seq[NimNode] = @[]
    attachments: set[AttachmentKind] = {}
    depthAtt = newEmptyNode()

  let
    rtssInfoSym = genSym(nskVar, "rgcRtssInfo")
    rasterSamplesN = newDotExpr(planSym.copyNimTree, ident"rasterizationSamples")

  body.add genAst(rtssInfoSym, rasterSamplesN) do:
    var rtssInfoSym = VkMultisampledRenderToSingleSampledInfoEXT(
      sType: MultisampledRenderToSingleSampledInfoExt,
      multisampledRenderToSingleSampledEnable: VkBool32(1),
      rasterizationSamples: rasterSamplesN)

  for output in info.outputs:
    let
      isTransient = output.sym notin c.consumed
      storeOp =
        if isTransient: bindSym("DontCare", brOpen)
        else: bindSym"Store"
      ob = c.binding(output.sym)
      view =
        if ob.view != nil: ob.view
        else: raiseAssert"Missing view" # TODO: this is dummy thing, need to do something (maybe error)
      mi = msaa.plans.getOrDefault(output.sym)
      loadOpExpr = loadOps[output.sym].copyNimTree

    var
      imageViewExpr, resolveModeExpr, resolveImageViewExpr, storeOpExpr: NimNode = default(NimNode)

    case mi.role
    of amrNone:
      imageViewExpr = view.copyNimTree
      resolveModeExpr = bindSym"VK_RESOLVE_MODE_NONE"
      resolveImageViewExpr = newCall(bindSym"VkImageView", newLit(0))
      storeOpExpr = storeOp
    of amrResolve:
      let
        explicitSource = msaaPlanUsesExplicitSourceExpr(planSym, mi.attachmentIdx)
        usesRtss = msaaPlanUsesRtssExpr(planSym)
        usesResolve = infix(explicitSource.copyNimTree, "or", usesRtss.copyNimTree)

      imageViewExpr =
        if mi.sourceView != nil:
          ifExpr(
            explicitSource.copyNimTree,
            mi.sourceView.copyNimTree, view.copyNimTree)
        else: view.copyNimTree
      
      resolveModeExpr = ifExpr(
        usesResolve.copyNimTree,
        attachmentResolveMode(output),
        bindSym"VK_RESOLVE_MODE_NONE")

      resolveImageViewExpr = ifExpr(
        explicitSource.copyNimTree,
        view.copyNimTree,
        newCall(bindSym"VkImageView", newLit(0)))

      storeOpExpr =
        ifExpr(
          explicitSource.copyNimTree, bindSym("DontCare", brOpen),
          storeOp)

    echo "    att: ",
      c.lit.syms[output.sym],
      " transient=",
      isTransient,
      " view=",
      (if ob.view != nil: "resolved" else: "MISSING")

    case output.attachment.usage
    of ukColorAttachment:
      attachments.incl ColorAttachment
      colorAtts.add genAttachmentInfo(
        imageViewExpr,
        resolveModeExpr,
        resolveImageViewExpr,
        loadOpExpr,
        storeOpExpr,
        genAst(clear = output.attachment.colorClear) do:
          VkClearValue(color: VkClearColorValue(float32: clear)))
    of ukDepthAttachment:
      attachments.incl DepthAttachment
      depthAtt = genAttachmentInfo(
        imageViewExpr,
        resolveModeExpr,
        resolveImageViewExpr,
        loadOpExpr,
        storeOpExpr,
        genAst(d = output.attachment.depthClear) do:
          VkClearValue(depthStencil: VkClearDepthStencilValue(depth: d, stencil: 0'u32)))
    else: discard

  let colorArrSym = genSym(nskVar, "rgcColorAtts")
  if ColorAttachment in attachments:
    body.arrayVar(colorArrSym, colorAtts)

  let depthSym = genSym(nskVar, "rgcDepthAtt")
  if DepthAttachment in attachments:
    body.add newVarStmt(depthSym, depthAtt)

  # TODO: maybe refactor into genAst
  var renderFields: seq[(string, NimNode)] = @[
    ("pNext", ifExpr(msaaPlanUsesRtssExpr(planSym), genAddr(rtssInfoSym), newNilLit())),
    ("sType", bindSym"RenderingInfo"),
    (
      "renderArea",
      objConstr(
        bindSym"VkRect2D",
        [
          (
            "extent",
            objConstr(
              bindSym"VkExtent2D",
              [
                ("width", newCall(bindSym"uint32", c.runtimeField("width"))),
                ("height", newCall(bindSym"uint32", c.runtimeField("height"))),
              ],
            ),
          )
        ],
      ),
    ),
    ("layerCount", newLit(1'u32)),
    ("colorAttachmentCount", newLit(uint32 colorAtts.len)),
    ]

  if ColorAttachment in attachments:
    renderFields.add ("pColorAttachments", genArrayAddr(colorArrSym))
  if DepthAttachment in attachments:
    renderFields.add ("pDepthAttachment", genAddr(depthSym))

  let renderInfoSym = genSym(nskVar, "rgcRenderInfo")
  body.add newVarStmt(renderInfoSym, objConstr(bindSym"VkRenderingInfo", renderFields))
  body.add newCall(
    bindSym"vkCmdBeginRendering", runtimeCb.copyNimTree, genAddr(renderInfoSym)
  )
  c.addExecuteCall(body, info, runtimeCb)
  body.add newCall(bindSym"vkCmdEndRendering", runtimeCb.copyNimTree)

  for output in info.outputs:
    let state = c.stateFor(output.sym)
    state.hasContents = true

  body

proc genCommandPass(c: var CodegenCtx, info: PassInfo): NimNode =
  let runtimeCb = c.runtimeField("cb")
  var body = newStmtList()
  body.add c.genResourceBarriers(info)
  c.addExecuteCall(body, info, runtimeCb)

  for output in info.outputs:
    let state = c.stateFor(output.sym)
    state.hasContents = true

  body

proc genPresentTransition(c: var CodegenCtx, sym: SymId): NimNode =
  let b = c.binding(sym)
  if b.image == nil or b.aspect == nil:
    raiseAssert "present target must be an image resource: " & c.lit.syms[sym]
  if b.layoutSlot == nil:
    raiseAssert "present target must be an external image with tracked layout: " &
      c.lit.syms[sym]

  let
    state = c.stateFor(sym)
    srcInfo =
      if state.currentUsage != ukNone:
        resourceAccessInfo(
          state.currentUsage, state.currentAccess,
          state.currentShaderDomain)
      else:
        emptyAccessInfo()
    dstInfo = presentAccessInfo()
    oldLayout = state.layoutExpr.copyNimTree
    barrierSym = genSym(nskVar, "rgcPresentBarrier")
    depInfoSym = genSym(nskVar, "rgcPresentDepInfo")

  result = newStmtList()
  result.add newVarStmt(
    barrierSym, buildImageBarrier(
      b.image, b.aspect, oldLayout,
      srcInfo, dstInfo))
  result.add newVarStmt(
    depInfoSym,
    objConstr(
      bindSym"VkDependencyInfo",
      [
        ("sType", bindSym"DependencyInfo"),
        ("imageMemoryBarrierCount", newLit(1'u32)),
        ("pImageMemoryBarriers", genAddr(barrierSym)),
      ]))

  result.add newCall(
    bindSym"vkCmdPipelineBarrier2",
    c.runtimeField("cb"), genAddr(depInfoSym))
  
  result.add newAssignment(b.layoutSlot, dstInfo.layout.copyNimTree)
  
  state.layoutExpr = dstInfo.layout.copyNimTree
  state.currentUsage = ukNone
  state.currentAccess = amRead
  state.currentShaderDomain = sdNone

proc genModuleCode(c: var CodegenCtx, moduleSym: SymId): NimNode =
  let info = c.modules[moduleSym]
  echo "  gen: ", c.lit.syms[moduleSym], " [module]"
  result = newStmtList()
  for sym in info.presents:
    echo "    present: ", c.lit.syms[sym]
    result.add c.genPresentTransition(sym)

proc genPassCode(c: var CodegenCtx, passSym: SymId): NimNode =
  let info = c.passes[passSym]
  echo "  gen: ", c.lit.syms[passSym], " [", info.kind, "]"
  case info.kind
  of pkRender: c.genRasterPass(info)
  of pkCompute, pkCopy: c.genCommandPass(info)

proc genCode*(
    sem: var SemContext[true],
    executes: Table[SymId, NimNode],
    externals: Table[SymId, NimNode],
    runtime: NimNode): NimNode =
  echo "\n=== CODEGEN ==="
  var ctx = CodegenCtx(
    lit: sem.lit,
    executes: executes,
    externals: externals,
    graph: sem.graph,
    sorted: sem.sorted,
    reachable: initHashSet[Node](),
    runtime: runtime.copyNimTree,
    resourceTypes: sem.resourceTypes,
    resourceParents: sem.resourceParents,
    consumed: initHashSet[SymId](),
    rootResourcePlans: initTable[SymId, RootResourcePlan]())

  for node in sem.sorted:
    ctx.reachable.incl node

  ctx.setup = newStmtList()

  echo "Collecting:"
  var cursor = beginRead(sem.dest)
  ctx.collect(cursor)
  endRead(sem.dest)
  ctx.resolveResourceViews(sem)

  echo "\nGenerating:"
  result = newStmtList()
  result.add ctx.setup
  for node in ctx.sorted:
    case node.kind
    of Pass:
      if node.s in ctx.passes:
        result.add genPassCode(ctx, node.s)
    of Module:
      if node.s in ctx.modules:
        result.add genModuleCode(ctx, node.s)
    else: discard

  echo "\nGenerated AST:"
  echo result.repr
  echo "=== END CODEGEN ==="
