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
DEPENDENCIES=(git wget build-essential ncurses-dev xz-utils bc libncurses-dev bison flex libssl-dev libelf-dev)

# Package Information
PKG_AUTHOR="torvalds"
PKG_NAME="linux"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"

# Functions
backup()
{
    : "
    Backup all important files
    "
    echo -e "[+] Backing up Kernel Boot config files..."
    cp -v /boot/config-$(uname -r) .config
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
    Configure the kernel source code configurations
    - Make your choices
    "

    # TUI (Terminal User Interface) color menus, radiolists, dialogs. Useful for remote server (SSH) kernel compilations.
    ${CC} menuconfig

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
        echo -e "[+] Kernel Compilation Successful." || \
        echo -e "[-] Kernel Compilation Error."
}

install_kernel_modules()
{
    : "
    Install the Linux Kernel Modules
    "
    ${CC} ${CFLAGS} modules_install && \
        echo -e "[+] Modules Installation Successful." || \
        echo -e "[-] Modules Installation Error."
}

install()
{
    : "
    Install the Linux Kernel
    "
    ${CC} install && \
        echo -e "[+] Kernel Installation Successful." || \
        echo -e "[-] Kernel Installation Error."
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
    echo -e "[+] Configure your kernel"    
    configure
    res="$?"
    if [[ "$res" == "1" ]]; then
	# Error
	echo -e "Error with configuring kernel"
	exit
    fi
    read -p '[O] Configuration completed.' tmp

    echo -e ""

    echo -e "[+] Starting Kernel Compilation"
    build
    res="$?"
    if [[ "$res" == "1" ]]; then
	# Error
	echo -e "Error with compiling kernel"
	exit
    fi
    read -p '[O] Compilation completed.' tmp

    echo -e ""

    echo -e "Starting installation..."
    install_kernel_modules
    res="$?"
    if [[ "$res" == "1" ]]; then
	# Error
	echo -e "Error with installing kernel modules"
	exit
    fi
    read -p "Paused" tmp

    echo -e ""

    install
    res="$?"
    if [[ "$res" == "1" ]]; then
	# Error
	echo -e "Error with installing kernel to boot partition"
	exit
    fi

    echo -e ""

    : " Cleanup process, uncomment this if you wish to cleanup the compilation automatically after installation
    clean
    res="$?"
    if [[ "$res" == "1" ]]; then
	# Error
	echo -e "Error with installing kernel modules"
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
