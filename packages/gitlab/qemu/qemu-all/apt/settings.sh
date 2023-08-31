# Initialize Variables

## Mutable Variables
REPO_AUTHOR="qemu"
REPO_PROJECT="qemu"
REPO_DOMAIN="https://git.qemu.org"
DEPENDENCIES=(git build-essential ninja-build libepoxy-dev libdrm-dev libgbm-dev libx11-dev libvirglrenderer-dev libpulse-dev libsdl2-dev libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev libepoxy-dev libdrm-dev libgbm-dev libx11-dev libvirglrenderer-dev libpulse-dev libsdl2-dev) # Set Dependencies
EDITOR="vim" # Set Default Editor

## Derivatives
REPO_URL=$REPO_DOMAIN/git/${REPO_PROJECT}.git

## Build System
CC="ninja"
CFLAGS="-C build"
