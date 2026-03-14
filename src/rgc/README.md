# Render graph dsl lang
# It compiles dsl code to actual render graph

# Architecture:
1. Frontend
   - Compile macro-based DSL declarations to `RGIR`.
   - Or compile `.rgir` files on disk to the same IR.
2. Semantic analysis
   - Perform some checks
   - Build the dependency graph and run topological sort.
3. Code generation


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

Parsing:
When used as macros: single node compiles to IR and initGraph(MainModule) run compilation of IR. 
(maybe) When used with files: Module compiles to IR and then compilation runned

After Parsing, we evaluate Semcheck, it checks errors, build topological sort etc.
After semcheck, it evaluates codegen:
there are some questions:
- Should it be vulkan only?
- Should it be bounded with rendering library and call it internals directly or
more abstract and use some interface? Answer: bound it currently, but when it will partialy working, move to interface


pass caps:
allowed:
(in/out SYMDEF), (raster/compute/copy/present ...),
not allowed:
(use SYM), (connect X Y), ()

module caps:
not allowed:
(raster/compute/copy/present ...)
