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


It's not current syntax, is evolved from this, TODO: fix this

Render graph description syntax:
```nim
pass lighting*:
  out hdr: Image[RGBA16F]

  raster:
    shader lightingShader

pass bloom*:
  in  src: Image[RGBA16F]
  out dst: Image[RGBA16F]

  compute:
    shader bloomShader

dynamic module postfx*:
  in  hdrIn:  Image[RGBA16F]
  out hdrOut: Image[RGBA16F]

  wire tmp: Image[RGBA16F]

  use bloom as bloom1
  use sharpen as sharp1

  default:
    connect hdrIn, hdrOut

pass tonemap*:
  in  hdr: Image[RGBA16F]
  out backbuffer: SwapchainImage

  raster:
    shader tonemapShader

module MainRendering*:
  use lighting as light
  use postfx   as fx
  use tonemap  as tone

  connect light.hdr, fx.hdrIn
  connect fx.hdrOut, tone.hdr
```

There are some questions:
- Should it be vulkan only?
- Should it be bounded with rendering library and call it internals directly or
more abstract and use some interface? Answer: bound it currently, but when it will partialy working, move to interface

TODO: write ops spec
