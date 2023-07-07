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

    # Change directory to build directory
    cd $BUILD_DIR

    # Check if package is installed
    for binary in "${BIN_NAMES[@]}"; do
        pkg_locations="$(which $binary)"
        if [[ "$?" -gt 0 ]]; then
            # = 0 = OK
            # > 0 = Error
            echo -e "Package $binary is not installed."
            exit 1
        fi
    done
}

uninstall_pkg()
{
    : "
    Uninstall the manually built from source package from host system
    "
    sudo ${CC} uninstall && \
        echo -e "[+] Uninstallation of package $PKG_NAME Successful." || \
        echo -e "[-] Uninstallation of package $PKG_NAME Error."
}

main()
{
    uninstall_pkg
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi

