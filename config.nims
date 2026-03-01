import std/os

task build, "build Adding Space (Debug mode)":
  switch("out", "build/AddingSpace")
  setCommand "c", "src/game_main.nim"

task release, "build Adding Space (Release mode)":
  switch("define", "release")
  switch("out", "build/AddingSpace")
  setCommand "c", "src/game_main.nim"

