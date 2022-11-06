#!/bin/env bash
: "
Manually compiling Shellinabox, A Web-based GUI SSH Terminal application that allows you to SSH on the browser (similar to Guacamole)

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: Debian
Target Package Manager: apt

Repository URL: https://github.com/shellinabox/shellinabox
"

# Build Info
CC="make"
CFLAGS=""
DEPENDENCIES=(git base-devel libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf)

# Package Information
PKG_AUTHOR="shellinabox"
PKG_NAME="shellinabox"
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
    Configure and Setup preinstallation settings and configurations
    "

    # Run autotools in project directory
    autoreconf -i

    # Run configure
    ./configure
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

    echo -e ""

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