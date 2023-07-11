#!/bin/env bash
: "
Settings for the manual builders
"

# Build Info
CC="python3"
CFLAGS="" # Use 4 cores/threads
DEPENDENCIES=(build-essential git python3 python3-setuptools)

# Package Information
PKG_AUTHOR="novnc"
PKG_NAME="websockify"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"
BIN_NAMES=(websockify)
