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

    # Change directory into source code
    cd $BUILD_DIR
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
