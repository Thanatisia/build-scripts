# Initialize Variables

## Mutable Variables
REPO_AUTHOR="git"
REPO_PROJECT="git"
REPO_DOMAIN="https://github.com"
DEPENDENCIES=(build-essential make autoconf gettext gcc g++ asciidoc libcurl4-openssl-dev) # Set Dependencies
EDITOR="vim" # Set Default Editor

## Derivatives
REPO_URL=$REPO_DOMAIN/$REPO_AUTHOR/$REPO_PROJECT
BIN=(git)
INSTALL_PATH=/usr/local

## Build System
CC="make"
CFLAGS=""
CONFIGURE_OPTS="--prefix=$INSTALL_PATH"
