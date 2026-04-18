import std/[os, strutils]

let hostIsWindows = getEnv("OS") == "Windows_NT"

proc pathNorm(p: string): string =
  ## Normalize path separators to the host OS because
  ## --os changes DirSep const that changes `/` operator
  if hostIsWindows: p.replace('/', '\\')
  else: p.replace('\\', '/')

when not defined(compilingForge):
  # strange but vmath doesn't support --define:nimPreviewSlimSystem
  --warningAsError:Uninit
  --warningAsError:ProveInit
  --experimental:strictDefs
  # siwin doesn't support --experimental:strictCaseObjects
  --experimental:vtables
  --experimental:inferGenericTypes
  --warning:StdPrefix
  --warningAsError:StdPrefix

--path:"src/gallonim/src"

when (
    defined(feature.AddingSpace.forge) and
    not defined(compilingForge) and
    not defined(atlas)):
  const forgeBin = "build/forge"
  if not fileExists(forgeBin):
    if not fileExists("deps/forge/src/forge.nim"):
      quit "forge sources not found. Run: atlas install --feature=forge"
    mkDir "build"
    exec "nim c -d:compilingForge -d:release --out:" & forgeBin &
      " deps/forge/src/forge.nim"
  switch("define", "forgePath=" & pathNorm(thisDir() / forgeBin))
  include "src/build_utils/crosscompile"
  include "src/build_utils/build_ktx"
  switch("passC", "-I" & pathNorm(ktxSrc / "include"))
  switch("passL", pathNorm(ktxStaticLib))
  # libktx need C++, so link libc++
  switch("passL", "-lc++")

proc evalCmdParams() =
  for param in commandLineParams():
    let (name, val) = (
      let x = param.split("=");
      (x[0], if x.len > 1: x[1] else: ""))
    
    case name
    of "target":
      if not defined(feature.AddingSpace.forge):
        quit "Target need forge feature. Run: atlas install --feature=forge"
      # handled in crosscompile.nim

proc buildTaskImpl() =
  evalCmdParams()
  var exe = "build/AddingSpace"
  when defined(feature.AddingSpace.forge) and declared(target):
    if inferOs(target) == "Windows":
      exe = exe.addFileExt("exe")
  else:
    if hostOs == "windows":
      exe = exe.addFileExt("exe")

  switch("out", exe)
  setCommand "c", "src/game_main.nim"

task build, "build Adding Space (Debug mode)":
  --define:nari.vulkanDebug # btw, validation layers not supported in Wine/Proton, so you need release build
  buildTaskImpl()

task release, "build Adding Space (Release mode)":
  --define:release
  buildTaskImpl()
