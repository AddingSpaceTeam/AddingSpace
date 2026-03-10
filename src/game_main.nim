## The module that launches the game

import std/sequtils
import pkg/siwin
import pkg/vulkan
import pkg/chronicles

var siwinGlobals = newSiwinGlobals()
vkPreload() # load vulkan
var vkInstance = VkInstance(0)

proc initGameWindow(): window.Window =
  var appInfo = newVkApplicationInfo(
    pApplicationName = "Adding Space",
    applicationVersion = vkMakeVersion(0, 1, 0, 0),
    pEngineName = "Renderer",
    engineVersion = vkMakeVersion(0, 1, 0, 0),
    apiVersion = vkApiVersion1_3
  )

  var exts = getRequiredVulkanExtensions()
  when defined(nari.vulkanDebug):
    # info "Vulkan validation layers enabled"
    exts.add "VK_EXT_debug_utils"
    const validationLayers = [cstring"VK_LAYER_KHRONOS_validation"]
  let extsC = exts.mapIt(cstring(it))

  var instanceCreateInfo = VkInstanceCreateInfo(
    sType: VkStructureType.InstanceCreateInfo,
    pApplicationInfo: appInfo.addr,
    enabledLayerCount:
      when defined(nari.vulkanDebug): validationLayers.len
      else: 0,
    ppEnabledLayerNames:
      when defined(nari.vulkanDebug): cast[cstringArray](validationLayers[0].addr)
      else: nil,
    enabledExtensionCount: uint32(extsC.len),
    ppEnabledExtensionNames:
      if extsC.len == 0: nil
      else: cast[cstringArray](extsC[0].addr),
  )

  if vkCreateInstance(instanceCreateInfo.addr, nil, vkInstance.addr) != VKSuccess:
    quit("Failed to create Vulkan instance")
  
  vkInit(vkInstance)

  # it's incredible but we need to create a window bound to the vulkan instance
  newVulkanWindow(
    siwinGlobals,
    cast[pointer](vkInstance),
    title = "Adding Space")


let window = initGameWindow()
let surface = cast[VkSurfaceKHR](window.vulkanSurface)
info "Vulkan initialized", vksurface = cast[uint64](surface)

run window, WindowEventsHandler(
  onResize: proc(e: ResizeEvent) =
    discard,
  onRender: proc(e: RenderEvent) =
    discard,
  onKey: proc(e: KeyEvent) =
    if e.pressed and e.key == Key.escape:
      close e.window)

