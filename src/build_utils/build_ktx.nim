import std/strutils

let
  triple = target.split('-')
  arch = triple[0]
  osName = case triple[1]
    of "linux": "Linux"
    of "windows": "Windows"
    of "macos", "darwin": "Darwin"
    of "freebsd": "FreeBSD"
    else: quit "unsupported target OS in triple: " & target

  ktxSrc = pathNorm(thisDir() / "deps" / "vendor" / "KTX-Software")
  ktxOut = pathNorm(thisDir() / "build" / "ktx" / target)
  ktxStaticLib = pathNorm(ktxOut / "libktx.a")

if not fileExists(ktxStaticLib):
  if not dirExists(ktxSrc):
    quit "KTX-Software sources missing at " & ktxSrc &
      ". Run: atlas install --feature=forge"

  echo "ktx: building libktx.a for ", target
  mkDir ktxOut
  let cmakeBuild = pathNorm(ktxOut / "cmake-build")
  mkDir cmakeBuild

  # KhronosGroup/KTX-Software didn't added ${CMAKE_C_COMPILER_ARG1} to 
  # ${CMAKE_C_COMPILER}, it's makes with `zig` so we patch it
  # (we can also create stub files, but patching better)
  let patchFile =
    pathNorm(thisDir() / "src" / "build_utils" / "ktx-cputypetest.patch")
  let gitApply = "git -C " & quoteShell(ktxSrc) & " apply "
  let (_, revCode) = gorgeEx(
    gitApply & "--reverse --check " &
    quoteShell(patchFile))
  if revCode != 0: exec gitApply & quoteShell(patchFile)

  let zigccFile = pathNorm(ktxOut / "zigcc.cmake")
  var zigcc = ""
  zigcc.add "set(CMAKE_SYSTEM_NAME "
  zigcc.add osName
  zigcc.add ")\n"
  zigcc.add "set(CMAKE_SYSTEM_PROCESSOR "
  zigcc.add arch
  zigcc.add ")\n"
  zigcc.add "set(CMAKE_C_COMPILER   zig cc)\n"
  zigcc.add "set(CMAKE_CXX_COMPILER zig c++)\n"
  zigcc.add "set(CMAKE_C_COMPILER_TARGET   "
  zigcc.add target
  zigcc.add ")\n"
  zigcc.add "set(CMAKE_CXX_COMPILER_TARGET "
  zigcc.add target
  zigcc.add ")\n"
  zigcc.add "set(CMAKE_C_ARCHIVE_CREATE   \"zig ar qc <TARGET> <LINK_FLAGS> <OBJECTS>\")\n"
  zigcc.add "set(CMAKE_C_ARCHIVE_FINISH   \"zig ranlib <TARGET>\")\n"
  zigcc.add "set(CMAKE_CXX_ARCHIVE_CREATE \"zig ar qc <TARGET> <LINK_FLAGS> <OBJECTS>\")\n"
  zigcc.add "set(CMAKE_CXX_ARCHIVE_FINISH \"zig ranlib <TARGET>\")\n"
  writeFile(zigccFile, zigcc)

  exec "cmake -S " & quoteShell(ktxSrc) &
       " -B " & quoteShell(cmakeBuild) &
       " -DCMAKE_TOOLCHAIN_FILE=" & quoteShell(zigccFile) &
       " -DCMAKE_BUILD_TYPE=Release" &
       " -DKTX_FEATURE_TESTS=OFF" &
       " -DKTX_FEATURE_TOOLS=OFF" &
       " -DKTX_FEATURE_LOADTEST_APPS=OFF" &
       " -DKTX_FEATURE_DOC=OFF" &
       " -DKTX_FEATURE_STATIC_LIBRARY=ON" &
       " -DKTX_FEATURE_GL_UPLOAD=OFF" &
       " -DBUILD_SHARED_LIBS=OFF"

  exec "cmake --build " & quoteShell(cmakeBuild) & " --target ktx"

  var found = ""

  for p in [pathNorm(cmakeBuild / "libktx.a"),
            pathNorm(cmakeBuild / "lib" / "libktx.a")]:
    if fileExists(p):
      found = p
      break

  if found.len == 0:
    quit "ktx: libktx.a not found under " & cmakeBuild

  cpFile(found, ktxStaticLib)

  echo "ktx: wrote ", ktxStaticLib
