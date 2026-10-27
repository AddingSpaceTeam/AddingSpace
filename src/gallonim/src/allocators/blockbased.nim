# SPDX-FileCopyrightText: 2026 AddingSpaceTeam
#
# SPDX-License-Identifier: MIT

# Block Allocator
# Similar to other GPU allocators (for example gpu-allocator):
# 1. Group same-memory-type allocations into one block
# 2. Compute allocation offset within block via GpuSubAllocator
import gpualloc
import std/options

const
  maxMemoryTypeId = 32

type
  Block[Sub] = object
    handle: pointer
    mappedPtr: pointer
    subAllocator: Sub

  BlockGpuAllocator*[B: BackendAllocModel; Sub] = object
    backend*: B
    blocks: array[maxMemoryTypeId, seq[Block[Sub]]]

    # debug info:
    totalAllocated*: uint64
    numAllocs*: uint32

proc init*[B: BackendAllocModel, Sub](
    _: type BlockGpuAllocator[B, Sub],
    backend: B): auto =
  BlockGpuAllocator[B, Sub](backend: backend)

proc alloc*[B: BackendAllocModel, Sub](a: var BlockGpuAllocator[B, Sub], desc: AllocDesc): Allocation =
  result = Allocation()
  let memTyp = a.backend.findMemoryType(desc.memoryTypeBits, desc.location)
  assert memTyp >= 0, "No compatible memory type found"

  # don't hack symchoices (we have system.alloc and this alloc, so we get open symchoice and subAllocator.alloc compiles, but this need to do it more correctly):
  mixin alloc

  if a.blocks[memTyp].len == 0:
    const blockSize = 256
    let handle = a.backend.allocateDeviceMemory(blockSize, memTyp.uint32, desc.deviceAddress)
    a.blocks[memTyp].add Block[Sub](
      handle: handle,
      subAllocator: Sub(cap: blockSize),
      mappedPtr:
        if desc.location in {CpuToGpu, GpuToCpu}:
          a.backend.mapMemory(handle, 0'u64, blockSize)
        else: nil)

  while true:
    template currBlock: untyped = a.blocks[memTyp][^1]

    let offset = currBlock.subAllocator.alloc(desc.size, desc.alignment)

    if offset.isSome:
      return Allocation(
        handle: currBlock.handle,
        offset: offset.unsafeGet(),
        size: desc.size,
        memoryTypeIndex: memTyp.uint32,
        location: desc.location,
        mappedPtr:
          if currBlock.mappedPtr != nil:
            # maybe some ARC/ORC stuff can be used instead of pointers?
            cast[pointer](cast[uint](currBlock.mappedPtr) + offset.unsafeGet().uint)
          else: nil)
    else:
      # minimal test variant:
      let blockSize = max(256'u64, desc.size)
      let handle = a.backend.allocateDeviceMemory(blockSize, memTyp.uint32, desc.deviceAddress)

      a.blocks[memTyp].add Block[Sub](
        handle: handle,
        subAllocator: Sub(cap: blockSize),
        mappedPtr:
          if desc.location in {CpuToGpu, GpuToCpu}:
            a.backend.mapMemory(handle, 0'u64, blockSize)
          else: nil)

proc free*[B: BackendAllocModel, Sub](a: var BlockGpuAllocator[B, Sub], alloc: Allocation) =
  var i = 0
  block finding:
    for x in a.blocks[alloc.memoryTypeIndex.int].mitems():
      if x.handle == alloc.handle:
        break finding
      inc i
    raiseAssert "Allocation not found"
  
  template x: untyped = a.blocks[alloc.memoryTypeIndex.int][i]
  # need to find symbol from other module:
  # BTW, nimony will solve it with type checked generics
  mixin free

  x.subAllocator.free(alloc.offset)
  if not x.subAllocator.hasAllocs:
    if x.mappedPtr != nil:
      a.backend.unmapMemory(x.handle)
    a.backend.freeDeviceMemory(x.handle)
    a.blocks[alloc.memoryTypeIndex.int].delete(i)
