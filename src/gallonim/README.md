gallonim (GPU ALLOcator NIM) is a GPU memory allocator written in Nim.
It supports Vulkan and maybe will support DirectX 12.

It's built around a simple idea: practical GPU allocation does not always require a highly sophisticated allocator. For many engines and applications, a free-list allocator is already good enough. Projects like [gpu-allocator](https://github.com/Traverse-Research/gpu-allocator) which are used in wgpu (and therefore in the webgpu implementation in firefox) demonstrate that relatively simple allocators can be used successfully in real programs.

A lot of allocator complexity comes from more advanced strategies such as TLSF.

Currently supported:
- Passthrough allocator (no allocator but with allocator api)

Planned:
- Free-list allocator

Considered:
- Dedicated block allocator for special cases
- TLSF allocator, if it proves necessary, good article: https://ricefields.me/2024/04/20/tlsf-allocator.html
