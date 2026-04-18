import std/os

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

when defined(feature.AddingSpace.forge) and not defined(compilingForge):
  const forgeBin = "build/forge"
  if not fileExists(forgeBin):
    if not fileExists("deps/forge/src/forge.nim"):
      quit "forge sources not found. Run: atlas install --feature=forge"
    mkDir "build"
    exec "nim c -d:compilingForge -d:release --out:" & forgeBin &
      " deps/forge/src/forge.nim"
  switch("define", "forgePath=" & (thisDir() / forgeBin))
  include "src/build_utils/crosscompile"
  # TODO: vendor libktx / vulkan etc, it need for cross compilation:
  switch("passC", "-I/usr/include")
  switch("passL", "-L/usr/lib")

task build, "build Adding Space (Debug mode)":
  --define:nari.vulkanDebug
  switch("out", "build/AddingSpace")
  setCommand "c", "src/game_main.nim"

task release, "build Adding Space (Release mode)":
  switch("define", "release")
  switch("out", "build/AddingSpace")
  setCommand "c", "src/game_main.nim"

