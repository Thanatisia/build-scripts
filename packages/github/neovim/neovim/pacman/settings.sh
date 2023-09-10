#!/bin/env bash
: "
Settings for the manual builders
"

# Build Info
CC="make"
CFLAGS="" # Use 4 cores/threads
DEPENDENCIES=(git ninja gettext libtool autoconf automake cmake base-devel pkg-config unzip curl doxygen)

# Package Information
PKG_AUTHOR="neovim"
PKG_NAME="neovim"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"
BIN_NAMES=(nvim)
