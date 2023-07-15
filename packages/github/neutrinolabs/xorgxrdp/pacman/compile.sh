#!/bin/env bash
: "
Manually Compiling from source code

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: Debian
Target Package Manager: apt
"

# Functions
setup()
{
    : "
    Setup all dependencies required to build
    "
    # Source settings file
    source $PWD/settings.sh

    # Set directory to build directory
    cd $BUILD_DIR
}

build()
{
    : "
    Compile and Build/make the package
    "
    echo -e "Current Working Directory: $BUILD_DIR"
    # make ${CFLAGS}
    ${CC} ${CFLAGS} && \
        echo -e "[+] Compilation successful." || \
        echo -e "[-] Error encountered during compilation."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    build
fi
