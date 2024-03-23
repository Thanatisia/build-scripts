# Initialize Variables

## Mutable Variables
REPO_AUTHOR="archlinux"
REPO_PROJECT="devtools"
REPO_DOMAIN="https://gitlab.archlinux.org"
DEPENDENCIES=(git build-essential arch-install-scripts gawk bash binutils coreutils diffutils fakeroot findutils grep jq libncurses5-dev ssh parallel rsync sed systemd util-linux bzr git mercurial subversion asciidoc asciidoctor shellcheck) # Set Dependencies
EDITOR="vim" # Set Default Editor

## Derivatives
REPO_URL=$REPO_DOMAIN/$REPO_AUTHOR/$REPO_PROJECT

## Build System
CC="make"
CFLAGS=""

