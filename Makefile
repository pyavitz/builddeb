CONF=./lib/config
DIALOGRC=$(shell cp -f lib/dialogrc ~/.dialogrc)
LINUX=./scripts/linux
PURGE=$(shell sudo rm -fdr linux*)

help:
	@echo
	@echo "Build linux kernel deb package x86_64/amd64"
	@echo
	@echo "Usage: "
	@echo
	@echo "  make depends           Install dependencies"
	@echo "  make config            Create user data file"
	@echo "  make kernel            Build kernel deb"
	@echo "  make purge             Remove tmp directory"
	@echo
	@echo "For details consult the README.md"
	@echo

depends:
	# Installing dependencies
	sudo apt install build-essential bc kmod cpio flex libncurses5-dev aria2 git dialog patch \
	rsync lzop lz4 libssl-dev
kernel:
	# Linux
	@chmod +x ${LINUX}
	@${LINUX}

# clean up
purge:
	# Removing tmp directory
	@${PURGE}
	@echo Done.

# menu
config:
	# User config menu
	@chmod +x ${CONF}
	@${CONF}


dialogrc:
	# Builder theme set
	@${DIALOGRC}

