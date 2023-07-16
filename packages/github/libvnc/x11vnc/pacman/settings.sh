#!/bin/env bash
: "
Settings for the manual builders
"

# Build Info
CC="make"
CFLAGS="" # Use 4 cores/threads
CONFIGURE_OPTS=""
DEPENDENCIES=(git base-devel make mk-configure autoconf automake pkg-config)

# Package Information
PKG_AUTHOR="LibVNC"
PKG_NAME="x11vnc"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"
BUILD_DIR="$PWD/$PKG_NAME/" # Build directory
BIN_NAMES=("x11vnc")
