#!/bin/env bash
: "
Settings for the manual builders
"

# Build Info
CC="make"
CFLAGS="" # Use 4 cores/threads
CONFIGURE_OPTS=""
BUILD_DIR="$PWD/xrdp/" # Build directory
DEPENDENCIES=(git base-devel make mk-configure autoconf automake pkg-config libtool nasm libxrandr fuse libfdk-aac ffmpeg imlib2)

# Package Information
PKG_AUTHOR="neutrinolabs"
PKG_NAME="xrdp"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"
BIN_NAMES=("xrdp" "xrdp-chansrv" "xrdp-sesman")
