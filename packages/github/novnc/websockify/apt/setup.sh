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
    sudo apt install "${DEPENDENCIES[@]}"
}

obtain_repository()
{
    # Clone git repository
    git clone --depth 1 "$SRC_URL"
}

update_python()
{
    : "
    Update and Install python dependencies
    "
    # Update python PyPI
    python3 -m pip install --upgrade pip
}

setup()
{
    : "
    Setup all dependencies required to build
    "
    source_files
    install_dependencies
    update_python
    obtain_repository

    # Change directory into source code
    cd $PKG_NAME
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
fi
