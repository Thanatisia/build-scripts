#!/bin/env bash
: "
Settings for the manual builders
"

# Build Info
CC="make"
CFLAGS="" # Use 4 cores/threads
CONFIGURE_OPTS=""
BUILD_DIR="$PWD/rofi/build/" # Build directory
DEPENDENCIES=(git base-devel make mk-configure autoconf automake pkg-config flex bison check cairo freetype2 libjpeg librsvg libx11 libxcb libxdg-basedir libxft libxkbcommon libxkbcommon-x11 pango startup-notification xcb-util xcb-util-cursor xcb-util-wm xcb-util-xrm)

# Package Information
PKG_AUTHOR="davatorium"
PKG_NAME="rofi"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"
BIN_NAMES=("rofi")
