#!/bin/env bash
: "
Kitty terminal emulator manual installation

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: ArchLinux 
Target Package Manager: pacman
"

# Build Info
CC="make"
CFLAGS="CMAKE_BUILD_TYPE=RelWithDebInfo"
DEPENDENCIES=(git libxrandr go python3 python-pip harfbuzz zlib libpng lcms2 librsync openssl freetype2 fontconfig libcanberra imagemagick python-pygments gcc pkg-config libxinerama xcb-util libxcb xcb-util-wm xcb-util-keysyms libgl mesa libxkbcommon libxkbcommon-x11 libxcursor libxi wayland-protocols)

# Package Information
PKG_AUTHOR="kovidgoyal"
PKG_NAME="kitty"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"

# Functions
setup()
{
    : "
    Setup all dependencies required to build
    "

    # Install dependencies
    pacman -S "${DEPENDENCIES[@]}"

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
    ln -sf ${PWD}/kitty/launcher/kitty /usr/local/bin/kitty && \
        echo -e "[+] Installation Successful." || \
        echo -e "[-] Installation Error."
}

generate_local_Docs()
{
    : "
    Setup the kitty documentation available locally
    "
    python3 -m pip install -Ur docs/requirements.txt && \
        make docs && \
            echo -e "[+] Documents generated successfully" || \
            echo -e "[-] Error generating Documents"
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
    install
    # clean
    generate_local_Docs
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
