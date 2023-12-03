# Initialize Variables

## Mutable Variables
REPO_AUTHOR="pacman"
REPO_PROJECT="pacman"
REPO_DOMAIN="https://gitlab.archlinux.org"
DEPENDENCIES=(git build-essential meson ninja-build cmake pkg-config libarchive-dev libcurl4-openssl-dev libcrypto++-dev libgpgme-dev libssl-dev zlib1g-dev) # Set Dependencies
EDITOR="vim" # Set Default Editor

## Derivatives
REPO_URL=$REPO_DOMAIN/$REPO_AUTHOR/$REPO_PROJECT

## Build System
CC="ninja"
CFLAGS="-C build"
