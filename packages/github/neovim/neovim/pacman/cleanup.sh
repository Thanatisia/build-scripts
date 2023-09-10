#!/bin/env bash
: "
Cleanup all temporary files created from the compilation/build process
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

clean()
{
    : "
    Cleanup and remove temporary files generated during compilation
    "
    ${CC} clean && \
        echo -e "[+] Cleanup Successful." || \
        echo -e "[-] Cleanup Error."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    clean
fi 
