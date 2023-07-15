#!/bin/env bash
: "
Manual Built from Source Package Installer
Install manually compiled from source packages to host system
"

# Functions
setup()
{
    : "
    Setup all dependencies required to build
    "
    # Source settings file
    source $PWD/settings.sh

    # Change directory to build directory
    cd $BUILD_DIR
}

begin_install()
{
    : "
    Install the binary
    "
    sudo ${CC} install && \
        echo -e "[+] Installation Successful." || \
        echo -e "[-] Installation Error."
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    begin_install
fi
