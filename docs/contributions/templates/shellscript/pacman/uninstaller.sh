#!/bin/env bash
: "
Manual Built from Source Package Uninstaller

Uninstall manually compiled from source packages installed to host system

Target Base System: ArchLinux 
Target Package Manager: pacman
"

# Build Info
CC="make"
CFLAGS="CMAKE_BUILD_TYPE=RelWithDebInfo"
DEPENDENCIES=(git ninja gettext libtool autoconf automake cmake base-devel)

# Package Information
PKG_AUTHOR="[repo-author-name]"
PKG_NAME="[repo-package-name]"
BIN_NAME="[package-binary]" # Binary Name
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"

# Functions
setup()
{
    : "
    Setup all dependencies required to build
    "

    # Check if package is installed
    pkg_locations="$(which $BIN_NAME)"
    if [[ "$?" -gt 0 ]]; then
        # = 0 = OK
        # > 0 = Error
        echo -e "Package $BIN_NAME is not installed."
        exit 1
    fi
}

uninstall_pkg()
{
    : "
    Uninstall the manually built from source package from host system
    "
    rm -f $(which $BIN_NAME) && \
        echo -e "[+] Uninstallation of $PKG_NAME Successful." || \
        echo -e "[-] Uninstallation of $PKG_NAME Error."
}

main()
{
    uninstall_pkg
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
