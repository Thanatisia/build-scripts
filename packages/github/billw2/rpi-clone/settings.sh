#!/bin/env bash
: "
Settings for the manual builders
"

# Build Info
CC="make"
CFLAGS="" # Use 4 cores/threads
DEPENDENCIES=(git wget golang)

# Package Information
PKG_AUTHOR="billw2"
PKG_NAME="rpi-clone"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"
BIN_NAMES=("rpi-clone" "rpi-clone-setup")
