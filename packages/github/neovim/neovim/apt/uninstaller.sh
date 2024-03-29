#!/bin/env bash
: "
Manual Built from Source Package Uninstaller

Uninstall manually compiled from source packages installed to host system

Target Base System: Debian 
Target Package Manager: apt
"

# Build Info
CC="make"
CFLAGS="CMAKE_BUILD_TYPE=RelWithDebInfo"
DEPENDENCIES=(git ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen)

# Package Information
PKG_AUTHOR="neovim"
PKG_NAME="neovim"
BIN_NAME="nvim" # Binary Name
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
