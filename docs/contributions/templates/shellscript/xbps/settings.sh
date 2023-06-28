#!/bin/env bash
: "
Settings for the manual builders
"

# Build Info
CC="make"
CFLAGS="" # Use 4 cores/threads
DEPENDENCIES=(git)

# Package Information
PKG_AUTHOR="project-author-name"
PKG_NAME="project-name"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"
BIN_NAMES=("binary" "names")
