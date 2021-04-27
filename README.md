## Build a linux kernel *.deb package
```sh
This repo was created for my own personal use and designed to help automate 
the kernel building process for the x86 computers I have laying about.

This being said; If you have your own defconfig, this little builder should
have no problem compiling and creating the *.deb packages for you.
```
### Dependencies
```sh
sudo apt install \
	build-essential bc kmod cpio flex libncurses5-dev aria2 git dialog \
	patch rsync lzop lz4 libssl-dev pv distro-info-data lsb-release make \
	libelf-dev wget
```
### Config Menu
```sh
Defconfig:		# Name of 'nameofdefconfig'_defconfig
Branch:			# Kernel branch
RC:			# 1 to download release candidate
GCC:			# Version
Arch:			# Supported: x86
Menuconfig:		# 1 to run kernel menuconfig | 0 to skip
rtl88XXau:		# 1 to add Realtek 8812AU/14AU/21AU wireless support
rtl88XXbu:		# 1 to add Realtek 88X2BU wireless support
rtl88XXcu:		# 1 to add Realtek 8811CU/21CU wireless support
```
### Commands
```sh
make depends		# Install dependencies
make config		# Create a userdata.txt file
make kernel		# Build deb package
make purge		# Remove sources directory
make purge-all		# Remove sources and output directory
make purge-wifi		# Remove wifi directories
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
