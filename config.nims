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

task build, "build Adding Space (Debug mode)":
  --define:nari.vulkanDebug
  switch("out", "build/AddingSpace")
  setCommand "c", "src/game_main.nim"

task release, "build Adding Space (Release mode)":
  switch("define", "release")
  switch("out", "build/AddingSpace")
  setCommand "c", "src/game_main.nim"

