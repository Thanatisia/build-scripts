#!/bin/env bash
: "
Pimox7 Install
- Port of Proxmox to the Raspberry Pi, allowing you to build a Proxmox cluster of Raspberry Pi's, or even a hybrid cluster of Pis and x86 hardware
	- By extension, ARM devices

Method: Prepare the apt sources list to install

Target Base System: Debian
Target Package Manager: apt

## Setup
### Pre-Requisites
 * Ensure that your server is connected with Ethernet Cable
 * Ensure that you have set a Static IP address for the Ethernet Interface (default: eth0) in /etc/network/interfaces
"

# Package Information
PKG_AUTHOR="pimox"
PKG_NAME="pimox7"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"

# Functions
setup()
{
    : "
    Setup all dependencies required to build
    "

    # Add pimox7 repository to apt sources.list.d
    echo "deb https://raw.githubusercontent.com/pimox/pimox7/master/ dev/" > /etc/apt/sources.list.d/pimox.list

    # Curl the Pimox7 GPG private key to import into apt-key
    curl https://raw.githubusercontent.com/pimox/pimox7/master/KEY.gpg | apt-key add -

    # Update apt package manager
    apt update && apt upgrade
}

install()
{
    : "
    Install and move the compiled binary to the host system
    "
    apt install proxmox-ve && \
        echo -e "[+] Installation Successful." || \
        echo -e "[-] Installation Error."
}

main()
{
    install
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi