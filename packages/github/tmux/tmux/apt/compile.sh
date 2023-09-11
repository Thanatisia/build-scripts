#!/bin/env bash
: "
Tmux Install

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: ArchLinux 
Target Package Manager: pacman
"

# Build Info
CC="make"
CFLAGS="CMAKE_BUILD_TYPE=RelWithDebInfo"
DEPENDENCIES=(git ninja-build gettext libtool autoconf automake cmake build-essential pkg-config unzip curl libncurses-dev libevent-dev bison byacc)

# Package Information
PKG_AUTHOR="tmux"
PKG_NAME="tmux"
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

configure()
{
    : "
    Configure the source code
    "
    # Auto-generate configuration file
    sh autogen.sh

    # Configure source code
    ./configure && \
        echo -e "[+] Configuration Successful." || \
        echo -e "[-] Configuration Error."
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
    configure
    build
    install
    # clean
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
