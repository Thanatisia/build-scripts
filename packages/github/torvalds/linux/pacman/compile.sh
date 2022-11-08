#!/bin/env bash
: "
Manually Compiling the Linux Kernel from source code

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: ArchLinux
Target Package Manager: pacman
"

# Build Info
CC="make"
CFLAGS="-j 4" # Use 4 cores/threads
DEPENDENCIES=(git wget base-devel ncurses xz bc bison flex openssl libelf)

# Package Information
PKG_AUTHOR="linux"
PKG_NAME="kernel"
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
    pacman -S "${DEPENDENCIES[@]}"

    # Clone git repository
    git clone --depth 1 "$SRC_URL

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
    ${CC}  && \
        echo -e "[+] Kernel Compilation Successful." || \
        echo -e "[-] Kernel Compilation Error."
}

install_kernel_modules()
{
    : "
    Install the Linux Kernel Modules
    "
    ${CC} modules_install && \
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

    echo -e ""

    build

    echo -e ""

    install_kernel_modules

    echo -e ""

    install

    echo -e ""

    clean

    # Completed
    echo -e "[O] Compilation completed, please update your bootloader filesystem (i.e. for GRUB: grub-mkconfig -o /boot/grub/grub.cfg), update-grub and update your initramfs (update-initramfs) after this"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
