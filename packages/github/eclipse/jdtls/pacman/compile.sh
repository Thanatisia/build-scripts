#!/bin/env bash
: "
Eclipse JDTLS Install

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: ArchLinux 
Target Package Manager: pacman
Reference Link: https://github.com/eclipse/eclipse.jdt.ls#installation
"

# Build Info
CC="./mvnw"
CFLAGS="-DskipTests=true clean verify"
DEPENDENCIES=(git ninja gettext libtool autoconf automake cmake base-devel pkg-config unzip curl ncurses jdk-openjdk)

# Additional Compile/Build Information
JAVA_VERSION="19"
JAVA_HOME="/usr/lib/jvm/java-$JAVA_VERSION-openjdk"

# Package Information
PKG_AUTHOR="eclipse"
PKG_NAME="eclipse.jdt.ls"
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
    # install
    # clean
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
