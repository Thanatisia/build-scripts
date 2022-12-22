#!/bin/env bash
: "
Manually Compiling the Linux Kernel from source code

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: Debian
Target Package Manager: apt
"

# Build Info
CC="make"
CFLAGS="-j 4" # Use 4 cores/threads
DEPENDENCIES=(git wget base-devel pkg-config)

# Package Information
PKG_AUTHOR="python"
PKG_NAME="cpython"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"

# Functions
setup()
{
    : "
    Setup all dependencies required to build
    "
    # Install dependencies
    pacman -S "${DEPENDENCIES[@]}"

    # Clone git repository
    git clone --depth 1 "$SRC_URL"

    # Change directory into source code
    cd $PKG_NAME
}

configure()
{
    : "
    Configure the kernel source code configurations
    - Make your choices
    "

    # TUI (Terminal User Interface) color menus, radiolists, dialogs. Useful for remote server (SSH) kernel compilations.
    ./configure

    # X-windows (Qt) based configuration tool, works best under KDE Desktop
    # ${CC} xconfig

    # X-windows (GTK) based configuration tool, works best under GNOME Desktop
    # ${CC} gconfig

}

build()
{
    : "
    Compile and Build/make the linux kernel
    "
    ${CC} ${CFLAGS} && \
        echo -e "[+] Compilation Successful." || \
        echo -e "[-] Compilation Error."
}

install()
{
    : "
    Install the Linux Kernel
    "
    ${CC} install && \
    # ${CC} altinstall && \
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
    echo -e "[+] Configure"    
    configure
    res="$?"
    if [[ "$res" == "1" ]]; then
	# Error
	echo -e "Error with configuring"
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
	echo -e "Error with installing binaries"
	exit
    fi

    echo -e ""

    : " Cleanup process, uncomment this if you wish to cleanup the compilation automatically after installation
    clean
    res="$?"
    if [[ "$res" == "1" ]]; then
	# Error
	echo -e 'Error with cleaning up'
	exit
    fi
    "

    # Completed
    echo -e "[O] Installation completed."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
