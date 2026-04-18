import std/strutils

const forgePath {.strdefine.} = if buildOs == "windows": "forge.exe" else: "forge"

proc targetTriple(): string =
  for param in commandLineParams():
    let (name, val) = (
      let x = param.split("=");
      (x[0], if x.len > 1: x[1] else: ""))

    if name == "target":
      return val

  const libc {.strdefine.} = ""
  var args = " +triple --cpu:" & hostCpu & " --os:" & hostOs
  if libc != "": args.add " --libc:" & libc
  let (output, code) = gorgeEx(forgePath & args)
  if code != 0: quit "failed to get target triple: " & output
  result = output

const target {.strdefine.} = targetTriple()

# better to import forge/zig but it can't compile with vm
# so this port of forge/zig.nim
proc inferCpu(triple: string): string =
  let cpu = triple.split('-')[0]
  case cpu
  of "x86_64": "amd64"
  of "aarch64", "aarch64_be": "arm64"
  of "arm", "armeb": "arm"
  of "x86": "i386"
  of "powerpc64el": "powerpc64le"
  of "m68k", "mips64el", "mipsel", "mips", "powerpc", "powerpc64",
     "riscv32", "riscv64", "sparc", "sparc64", "wasm32": cpu
  else:
    quit "failed to match target triple " & triple & " to a known cpu"

proc inferOs*(triple: string): string =
  let os = triple.split('-')[1]
  case os
  of "windows", "linux": os.capitalizeAscii()
  of "macos": "MacOSX"
  of "freebsd": "FreeBSD"
  of "openbsd": "OpenBSD"
  of "netbsd": "NetBSD"
  of "wasm": "Linux"
  else:
    quit "failed to match target triple " & triple & ", to a known OS"

switch("cpu", inferCpu(target))
switch("os", inferOs(target))

# this script runs after default nim.cfg that sets linker flags based on OS (incorrect in fact)...
# so switch("os") can't change it, so erase it, forge will handle it anyway
switch("clang.options.linker", "")
switch("clang.cpp.options.linker", "")

switch("cc", "clang")
switch("clang.exe", forgePath)
switch("clang.linkerexe", forgePath)
switch("clang.cpp.exe", forgePath)
switch("clang.cpp.linkerexe", forgePath)

switch("passC", "-target " & target)
switch("passL", "-target " & target)

when hostOs == "macosx" and not defined(noMacosSdk):
  const (flags, code) = gorgeEx(forgePath & " +sdk-flags")
  if code != 0: quit "failed to get sdk flags: " & flags
  switch("passC", flags)
  switch("passL", flags)


