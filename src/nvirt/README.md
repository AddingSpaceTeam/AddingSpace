<!--
SPDX-FileCopyrightText: 2026 AddingSpaceTeam

SPDX-License-Identifier: MIT
-->

# Nvirt

> [!WARNING]
> Implementation status: unimplemented

An engine component designed for the paravirtualization of a game. It can be used for verifying that the game rendering and logic behaves consistently across different operating systems (and graphical API's). So, because we working with games, we need GPU acceleration on virtual machine, to do this we need couple of ways for paravirtualization:
| Host OS | Guest OS | Guest graphical API| How to paravirtualize |
| --------| ------- | ------------------- | ------- |
| Linux   | Linux   | Vulkan              | QEMU with Venus driver or via VirtIO-GPU Native Context [^4] |
| Linux   | Linux   | Opengl              | QEMU with Zink driver and Venus driver [^3] or via VirtIO-GPU Native Context [^4]|
| Linux   | Windows | Vulkan              | QEMU with kvm-guest-drivers-windows [^1] based driver or [Helios](https://github.com/winboat-org/helios) [^2] | 
| Linux   | Windows    | Directx        | QEMU with Triton driver or QEMU with [Helios](https://github.com/winboat-org/helios) [^2] Driver |
| Windows   | Windows    | Directx/Opengl/Vulkan | Hyper-V GPU-PV [^5] |
| Windows   | Linux      | Opengl | Hyper-V GPU-PV [^5] for dxgkrnl and Gallium D3D12 for opengl to d3d12 |
| Windows   | Linux      | Vulkan | Hyper-V GPU-PV [^5] for dxgkrnl and Dozen for vulkan to d3d12 |


[^1]: `kvm-guest-drivers-windows` is pack of KVM drivers for guest windows OS. The table specifically refers to `viogpu3d` graphics driver which based on `viogpudo`.
[^2]: [`Helios`](https://github.com/winboat-org/helios) is a graphics driver written from scratch in Rust.
[^3]: this scheme preferred to virGL
[^4]: VirtIO Native Context is a mechanism that allows a guest VM to submit GPU commands directly to the host kernel driver. It gives maximum performance, but requires GPU driver support and can be unsafe.
[^5]: Hyper-V GPU-PV is a same mechanism as VirtIO Native Context, but for windows. Unlike native context, where a specific GPU driver is required, Hyper-V GPU-PV can work with any GPU driver that have WDDM 2.4+ support. It works because Microsoft made WDDM support mandatory for GPU drivers.

<details>
<summary><b>Triton and Helios comparison for DirectX virtualization</b></summary>

- Helios runs DXVK on guest OS and sends Vulkan API calls via Venus. This means, it's using processor from virtualized OS, so DXVK can use only limited by vm numbers of cores for translation, also in case of CPU virtualization (same cpu in guest and host OS), it can work with near-native speed, but for emulation, this will be slow.
- Triton uses it's own protocol to send DirectX API calls to host OS, where runs DXVK. This approach should be faster, but has more components to maintain.
</details>

## VM creation

Project must have the capability to create virtual machines. And many OS on guest side have install settings, to skip it, we need `Autounattend.xml` for Windows guest, cloud-init + Cloud image for Linux guest or user_configuration.json for Arch, ks.cfg for Fedora/CentOS/Red Hat Enterprise Linux, preseed.cfg for Debian. These files can be generated using `virt-install`. However, it lacks some important things, e.g it doesn't detect the language from a Windows iso, so `Autounattend.xml` can be wrong.

So unattended file generation pipelines:
#### Autounattend.xml:
1. windows.iso
2. Find array of bytes for sequence: `[Available UI Languages]` (should be accurate as extract iso (it uses UDF filesystem, that pretty hard to implement) and read `sources/lang.ini`). With mmap this much faster than reading UDF. ISO can have many langs, we need line, ended by `= 3`. Result of this step is locale in form: `en-gb`
3. Make ISO-9660 iso with `Autounattend.xml` which will be loaded with system


> [!IMPORTANT]
> If `Autounattend.xml` incorrect, Windows will show some questions, i.e. scenario will break. 

## Getting frame data

Games are fast, so we need to use QEMU for initial step, but then can do perform communication directly.
This is how vulkan passthrough works:
1. game (on guest): `vkAllocateMemory()`
2. venus (on host): `vkAllocateMemory()` => blob_id
3. venus (on host):`ioctl(DRM_IOCTL_VIRTGPU_RESOURCE_CREATE_BLOB, blob_mem = HOST3D, blob_id = blob_id)` => resource_id
4. QEMU (on host): dispatch command `VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB(resource_id, blob_id)`
5. QEMU (on host): `virgl_renderer_resource_create_blob(resource_id, blob_id)`
6. QEMU (on host): vkGetMemoryFdKHR => fd
7. QEMU (on host): virgl_resource_table[resource_id] = fd.

And fd is exacly what we need.
