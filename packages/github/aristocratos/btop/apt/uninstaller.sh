#!/bin/env bash
: "
Manual Built from Source Package Uninstaller
Uninstall manually compiled from source packages installed to host system
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

uninstall_pkg()
{
    : "
    Uninstall the manually built from source package from host system
    "
    sudo ${CC} uninstall
}

main()
{
    uninstall_pkg
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi

