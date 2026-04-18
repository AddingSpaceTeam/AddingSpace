when defined(atlas):
  # dirty hack workaround of bug:
  # `after install` runs nim e AddingSpace.nimble
  # feature implemented as ast walking, so it produces error
  template feature(name: string; body) = discard

requires "https://github.com/planetis-m/vulkan#07669e9"

requires "https://github.com/levovix0/siwin#d9b7ae8"

requires "x11"

requires "https://github.com/ASVIEST/nim-chronicles#fix/uninit-proveinit-log-macro"

feature "forge":
  # yes, we can add check for installed forge
  # but we have no guarantee that it will ship with
  # new zig cc and forge +nims (src/build_utils/crosscompile.nim)
  # will same

  requires "https://github.com/daylinmorgan/forge"
  # siwin checks when defined(windows), but we cross compile so need it:
  requires "winim"

after install:
  # fun fact: it run config.nims from atlas
  if dirExists("deps/forge") and not dirExists("deps/vendor/KTX-Software"):
    mkDir "deps/vendor"
    exec "git clone --depth 1 --branch v4.4.2 " &
      "https://github.com/KhronosGroup/KTX-Software.git deps/vendor/KTX-Software"

