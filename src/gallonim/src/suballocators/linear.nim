# SPDX-FileCopyrightText: 2026 AddingSpaceTeam
#
# SPDX-License-Identifier: MIT

# Linear/Arena (sub)allocator
# An this is the simplest allocator:
# https://www.gingerbill.org/article/2019/02/08/memory-allocation-strategies-002/
import std/options
import ../allocators/gpualloc

type
  LinearSubAllocator* = object
    cap*: uint
    head: uint

    numAlloc: int
    
proc alloc*(a: var LinearSubAllocator, size: uint, alignment: uint = 0): Option[uint] =
  # TODO: implement aligment
  if a.head + size <= a.cap:
    a.head.inc size
    inc a.numAlloc
    some(a.head)
  else:
    return none(uint)

proc free*(a: var LinearSubAllocator, _: uint) =
  # linear allocator can't be freed by offset, we can only free all
  assert a.numAlloc > 0
  dec a.numAlloc
  # to be correct:
  if a.numAlloc == 0:
    a.head = 0

proc hasAllocs*(a: LinearSubAllocator): bool {.inline.} = a.numAlloc > 0

static:
  assert LinearSubAllocator is SubAllocator
