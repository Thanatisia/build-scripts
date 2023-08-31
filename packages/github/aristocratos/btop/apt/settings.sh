#!/bin/env bash
: "
Settings for the manual builders
"

# Build Info
CC="make"
CFLAGS="" # Use 4 cores/threads
DEPENDENCIES=(git build-essential coreutils sed gcc g++)

# Package Information
PKG_AUTHOR="aristocratos"
PKG_NAME="btop"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"
BIN_NAMES=(btop)
