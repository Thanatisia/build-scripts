#!/bin/env bash
: "
Settings for the manual builders
"

# Build Info
CC="make"
CFLAGS="" # Use 4 cores/threads
DEPENDENCIES=(build-essential git coreutils pkgconf openssl libarchive)

# Package Information
PKG_AUTHOR="void-linux"
PKG_NAME="xbps"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"
BIN_NAMES=(xbps-create xbps-dgraph xbps-install xbps-pkgdb xbps-query xbps-reconfigure xbps-remove xbps-rindex)
