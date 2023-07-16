#!/bin/env bash
: "
Setup repository and system structure for compilation

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: Debian
Target Package Manager: apt
"

source_files()
{
    # Source settings file
    source $PWD/settings.sh
}

install_dependencies()
{
    : "
    Install and setup dependencies
    "
    # Install dependencies
    sudo pacman -S "${DEPENDENCIES[@]}"
}

obtain_repository()
{
    # Clone git repository
    git clone --depth 1 "$SRC_URL"
}

setup_repository()
{
    : "
    Prepare repository for building
    "
    ## Change directory into source code
    cd $PKG_NAME

    ## Prepare repository
    # Generate the build system
    autoreconf -fiv && \
        echo -e "[+] Build System generated." || \
        echo -e "[-] Error generating build system."

    # Configure
    ./configure ${CONFIGURE_OPTS} && \
        echo -e "[+] Configuration completed." || \
        echo -e "[-] Error with configuration."
}

setup()
{
    : "
    Setup all dependencies required to build
    "
    source_files
    install_dependencies
    obtain_repository
    setup_repository
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
fi
