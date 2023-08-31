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

begin_install()
{
    : "
    Install the binary
    "
    if [[ "$pkg_exists" == "1" ]]; then
        # If target folder exists
        # Copy to system files
        sudo ${CC} install && \
            echo -e "[+] Installation Successful." || \
            echo -e "[-] Installation Error."
    fi
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    begin_install
fi
