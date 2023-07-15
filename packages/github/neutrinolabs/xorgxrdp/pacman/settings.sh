#!/bin/env bash
: "
Settings for the manual builders
"

# Build Info
CC="make"
CFLAGS="" # Use 4 cores/threads
DEPENDENCIES=(git base-devel make mk-configure autoconf automake pkg-config libtool nasm libxrandr fuse libfdk-aac ffmpeg imlib2)
CONFIGURE_OPTS="XRDP_CFLAGS=-I/usr/local/sbin"

# Package Information
PKG_AUTHOR="neutrinolabs"
PKG_NAME="xorgxrdp"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"
BIN_NAMES=("xorgxrdp")
BUILD_DIR="$PWD/$PKG_NAME/" # Build directory

# Environment Variables Overwrite
