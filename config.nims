import std/os

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

task build, "build Adding Space (Debug mode)":
  --define:nari.vulkanDebug
  switch("out", "build/AddingSpace")
  setCommand "c", "src/game_main.nim"

task release, "build Adding Space (Release mode)":
  switch("define", "release")
  switch("out", "build/AddingSpace")
  setCommand "c", "src/game_main.nim"

