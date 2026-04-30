# Render graph dsl lang
And it compiles dsl code to actual render graph

Modifying:
Editing tags:
1. Edit `doc/tags.md`
2. Run: `nim c -r tagmodel/tools/gen_tags.nim`
It will regenerate files:
`tagmodel/tags.nim`, `tagmodel/model_tags.nim` 

# Compile pipeline
1. rgc dsl parsed via nim macros into RGIR, perfomed in `macrofront.nim`
2. RGIR going into semcheck, perfomed in `sem.nim`, result is topologicaly sorted passes (modules is only graph shape thing and not present for codegen (but currently present, it's big problem, need to be fixed))
3. Codegen — hardest place, we need to generate code for vulkan, it include some interesting things:
  - Barriers: we generating it for every input and output of render pass, see callsite of `transitionResource`, it only place where we generate barriers. I think it even can be moved into backend agnostic IR in future.
  - Attachments management: attachments is one of important resource types, we need to generate code that can use attacments correctly. Possible to generalize.
  - MSAA plans: currently it seem fully backend specific but need more detail thinking about it.

## Quickstart:
```nim
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
```

## Spec

### Usage Annotations
Usage annotations is pragmas added to input/output keywords like
```nim
input someInput {.usageAnnotation, *attachmentModifier.}
```
usage annotations can have args, like this:
```nim
output color {.colorAttachment(1.0, 0.6, 0.2, 1.0).}: Image[B8G8R8A8_SRGB, FullScreen]
```

Supported usages:

| Pragma          | Access                      | Input | Output | Desc |
|-----------------|-----------------------------|-------|--------|------|
| colorAttachment | ColorAttachmentWrite        | -     | +      | clear color ∈ [0.0, 1.0], without args (0.0, 0.0, 0.0, 1.0) |
| depthAttachment | DepthStencilAttachmentWrite | -     | +      | clear depth, without args it's 1.0 |
| sampled         | ShaderRead                  | +     | -      | texture sampling |
| storage         | ShaderRead, ShaderWrite     | +     | +      | storage image/buffer |
| transferSrc     | TransferRead                | +     | -      | copy source          |
| transferDst     | TransferWrite               | -     | +      | copy destination     |

Attachment modifiers:
| Modifier                                     | Require pragmas                  | Desc |
|----------------------------------------------|----------------------------------|------|
| resolveAttachment(avg/sample0/min/max)       | colorAttachment, depthAttachment | makes output channel multisampled, for colorAttachment useful only avg |
| samples(INTLIT)                              | resolveAttachment                | how many samples it will create |
| samplesPolicy(flexible/exact/atLeast/atMost) | resolveAttachment                | how we can modify sample count  |
| enableMsaaImgAccess                          | resolveAttachment                | marks resolveAttachment that shader have access for multisampled image, it disables things like VK_EXT_multisampled_render_to_single_sampled because it can't expose real MSAA image|

### samplesPolicy:
| Policy   | Desc |
|----------|------|
| flexible | rgc can change sample count as it want |
| exact    | rgc should use only defined sample count, usefull in pair with enableMsaaImgAccess. You can try use different sample counts, but it unavailable on GPUs other than NVIDIA and AMD so it will raise assert for platforms without it, also currently rgc don't use required extensions for it, so varrying currently just disallowed |
| atLeast  | if it can't work with different sample counts for current GPU (that currently always) samples = min(sampleCounts) |
| atMost   | if it can't work with different sample counts for current GPU (that currently always) samples = max(sampleCounts) |

There are some questions:
- Should it be vulkan only?
- Should it be bounded with rendering library and call it internals directly or
more abstract and use some interface? Answer: bound it currently, but when it will partialy working, move to interface
- Maybe unify transferSrc, transferDst into `transfer`, knowing that it in input/output, but it can lead to problems
