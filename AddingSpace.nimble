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

