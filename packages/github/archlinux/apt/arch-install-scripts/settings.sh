#!/bin/env bash
: "
Settings for the manual builders
"

# Build Info
CC="make"
CFLAGS="" # Use 4 cores/threads
DEPENDENCIES=(git coreutils util-linux asciidoc)

# Package Information
PKG_AUTHOR="archlinux"
PKG_NAME="arch-install-scripts"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"
BIN_NAMES=(genfstab pacstrap arch-chroot)
