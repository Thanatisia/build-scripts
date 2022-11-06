#!/bin/env bash
: "
filebrowser Install
- File Browser is a Web-based (WebUI) File Manager for your Home Lab Server
"

# Package Information
PKG_AUTHOR="filebrowser"
PKG_NAME="filebrowser"
SRC_URL="https://github.com/$PKG_AUTHOR/$PKG_NAME"

# Install Script Information
INSTALL_SCRIPT_REPO="get"
INSTALL_SCRIPT_BRANCH="master"
INSTALL_SCRIPT_FILENAME="get.sh"
INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/$PKG_AUTHOR/$INSTALL_SCRIPT_REPO/$INSTALL_SCRIPT_BRANCH/$INSTALL_SCRIPT_FILENAME"

# Functions
setup()
{
    : "
    Setup all dependencies required to build
    "

    # Download filebrowser install script
    curl -L -O $INSTALL_SCRIPT_URL

    echo -e "==========="

    # Display source code 
    echo -e "Displaying source code for $INSTALL_SCRIPT_FILENAME"

    echo -e ""

    cat $INSTALL_SCRIPT_FILENAME

    echo -e ""

    echo -e "==========="
    
    # Pause to read
    read -p "Paused for reading the script." paused
}

permission()
{
    : "
    Prepare permission for execution
    "
    chmod u+x $INSTALL_SCRIPT_FILENAME
}

install()
{
    : "
    Install and move the compiled binary to the host system
    "
    ./$INSTALL_SCRIPT_FILENAME && \
        echo -e "[+] Installation Successful." || \
        echo -e "[-] Installation Error."
}

main()
{
    permission

    echo -e ""

    install
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi