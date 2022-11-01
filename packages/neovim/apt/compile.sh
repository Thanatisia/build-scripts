#!/bin/env bash
: "
Neovim Install

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: Debian
"

# Build Info
CC="make"
CFLAGS="CMAKE_BUILD_TYPE=RelWithDebInfo"
DEPENDENCIES=(ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen)

# Package Information
PKG_AUTHOR="neovim"
PKG_NAME="neovim"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"

# Functions
setup()
{
    : "
    Setup all dependencies required to build
    "

    # Install dependencies
    apt install "${DEPENDENCIES[@]}"

    # Clone repository
    git clone "$SRC_URL"

    # Change directory into repository
    cd $PKG_NAME
}

build()
{
    : "
    Compile and Build/make the source code into an executable 
    "
    ${CC} ${CFLAGS} && \
        echo -e "[+] Compilation Successful." || \
        echo -e "[-] Compilation Error."
}

install()
{
    : "
    Install and move the compiled binary to the host system
    "
    ${CC} install && \
        echo -e "[+] Installation Successful." || \
        echo -e "[-] Installation Error."
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

main()
{
    build

    echo -e "" 

    install

    echo -e "" 

    clean
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi