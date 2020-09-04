# Linux kernel builder for Debian

### Config Menu
```sh
Defconfig:    # Name of yourfile_defconfig
Branch:       # Kernel branch
Arch:         # Supoported: x86, arm64 and arm (native compile only)
Menuconfig:   # 1 to run kernel menuconfig | 0 to skip
```
### Commands
```sh
make depends  # Install dependencies
make config   # Create a userdata.txt file
make kernel   # Build deb package
make purge    # Remove temporary directory
```
### User Patches
```sh
Patches "-p1" placed in the patches directory are applied during compilation.
```

### Notes
```sh
The name of your defconfig, will become the name of the kernel packages created.
For example: nameofdefconfig-linux-image nameofdefconfig-linux-headers
```
