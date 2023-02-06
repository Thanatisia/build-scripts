#!/bin/env bash
: "
Manually Compiling from source code

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: Debian
Target Package Manager: apt
"

# Build Info
CC="make"
CFLAGS="-j 4" # Use 4 cores/threads
DEPENDENCIES=(place your dependencies here)

# Package Information
PKG_AUTHOR="AUTHOR_NAME_HERE"
PKG_NAME="REPOSITORY_NAME_HERE"
BIN_NAME="PACKAGE BINARY HERE" # Binary Name
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"

# Functions
backup()
{
    : "
    Backup all important files
    "
    echo -e "[+] Backing up system files..."
}

setup()
{
    : "
    Setup all dependencies required to build
    "
    # Backup important files
    backup

    # Install dependencies
    apt install "${DEPENDENCIES[@]}"

    # Clone git repository
    git clone --depth 1 "$SRC_URL"

    # Change directory into source code
    cd $PKG_NAME
}

configure()
{
    : "
    Configure the source code configurations
    - Make your choices
    "
}

build()
{
    : "
    Compile and Build/make the source code
    "
    ${CC} ${CFLAGS} && \
        echo -e "[+] Compilation Successful." || \
        echo -e "[-] Compilation Error."
}

install()
{
    : "
    Install the built executable to the appropriate locations
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
    echo -e "[+] Configure your source code"    
    configure
    res="$?"
    if [[ "$res" == "1" ]]; then
	# Error
	echo -e "Error with configuring kernel"
	exit
    fi
    read -p '[O] Configuration completed.' tmp

    echo -e ""

    echo -e "[+] Starting Compilation"
    build
    res="$?"
    if [[ "$res" == "1" ]]; then
	# Error
	echo -e "Error with compilation"
	exit
    fi
    read -p '[O] Compilation completed.' tmp

    echo -e ""

    install
    res="$?"
    if [[ "$res" == "1" ]]; then
	# Error
	echo -e "Error with installing executable"
	exit
    fi

    echo -e ""

    : " Cleanup process, uncomment this if you wish to cleanup the compilation automatically after installation
    clean
    res="$?"
    if [[ "$res" == "1" ]]; then
	# Error
	echo -e "Error with cleaning up"
	exit
    fi
    echo -e "Successfully cleaned up repository"
    "

    # Completed
    echo -e "[O] Installation completed."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
