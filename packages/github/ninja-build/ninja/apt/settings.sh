# Initialize Variables

## Mutable Variables
REPO_AUTHOR="ninja-build"
REPO_PROJECT="ninja"
REPO_DOMAIN="https://github.com"
DEPENDENCIES=(build-essential make gcc g++ asciidoc re2c doxygen graphviz) # Set Dependencies
EDITOR="vim" # Set Default Editor

## Derivatives
REPO_URL=$REPO_DOMAIN/$REPO_AUTHOR/$REPO_PROJECT
BIN=(ninja)
INSTALL_PATH=/usr/local

## Build System
CC="ninja"
CFLAGS=""
CONFIGURE_OPTS="--bootstrap"
