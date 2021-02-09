CONF=./lib/config
DIALOGRC=$(shell cp -f lib/dialogrc ~/.dialogrc)
XLINUX=./scripts/linux
LINUX=sudo ./scripts/linux
PURGE=$(shell sudo rm -fdr sources)
PURGEALL=$(shell sudo rm -fdr sources output)
PURGEWIFI=$(shell sudo rm -fdr sources/rtl*)

help:
	@echo
	@echo "Build linux kernel deb package x86_64/amd64"
	@echo
	@echo "Usage: "
	@echo
	@echo "  make depends           Install dependencies"
	@echo "  make config            Create user data file"
	@echo "  make kernel            Build kernel deb"
	@echo "  make purge             Remove sources directory"
	@echo "  make purge-all         Remove sources and output directory"
	@echo "  make purge-wifi        Remove wifi directories"
	@echo
	@echo "For details consult the README.md"
	@echo

depends:
	# Installing dependencies
	sudo apt install build-essential bc kmod cpio flex libncurses5-dev aria2 git dialog patch \
	rsync lzop lz4 libssl-dev pv distro-info-data lsb-release
kernel:
	# Linux
	@chmod +x ${XLINUX}
	@${LINUX}

# clean up
purge:
	# Removing sources directory
	@${PURGE}
	@echo Done.

purge-all:
	# Removing sources directory
	@${PURGEALL}
	@echo Done.

purge-wifi:
	# Removing sources/wifi directories
	@${PURGEWIFI}
	@echo Done.

# menu
config:
	# User config menu
	@chmod +x ${CONF}
	@${CONF}

dialogrc:
	# Builder theme set
	@${DIALOGRC}

