#!/bin/env bash
: "
Manually Compiling from source code

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: ArchLinux
Target Package Manager: pacman
"

# Functions
setup()
{
    : "
    Setup all dependencies required to build
    "
    # Source settings file
    source $PWD/settings.sh

    # Check if target files/folders exists
    pkg_exists=0
    if [[ -d "$PKG_NAME" ]]; then
        # Package folder exists
        pkg_exists=1

        # Change directory into source code
        cd $PKG_NAME
    else
        echo -e "Package repository directory does not exists."
        exit
    fi
}

build()
{
    : "
    Compile and Build/make the package
    "
    ${CC} ${CFLAGS} && \
        echo -e "[+] binaries have been downloaded." || \
        echo -e "[-] binaries download error."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    build
fi
