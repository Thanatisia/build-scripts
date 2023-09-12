#!/bin/env bash
: "
Install build source files and binaries into system
"
setup()
{
    : "
    Prepare and setup source directory
    "
    # Source files
    . settings.sh

    # If directory exists
    if [[ -d $REPO_PROJECT ]]; then
        # change directory
        cd $REPO_PROJECT
    else
        # Doesnt exist, exit
        echo -e "Directory [$REPO_PROJECT] does not exist, exiting..."
        exit 1
    fi
}

install_user_only()
{
    : "
    Install built files from local repository to user directory
    "
    # Install binary
    cp ${BIN[@]} $HOME/.local/bin && \
        echo -e "Installation of [${BIN[@]}] => [$HOME/.local/bin] is Successful." || \
        echo -e "Error during installation of [${BIN[@]}] => [$HOME/.local/bin]."

    # Install code documentations
    cp -r doc $HOME/.local/share/doc/$REPO_PROJECT && \
        echo -e "Installation of [doc] => [$HOME/.local/share/doc/$REPO_PROJECT] is Successful." || \
        echo -e "Error during installation of [doc] => [$HOME/.local/share/doc/$REPO_PROJECT]."
    
    # Install manuals
    
    # Install miscelleneous
    ## Bash autocompletion
    cp misc/bash-completion $HOME/.local/share/bash-completion/completions/$REPO_PROJECT && \
        echo -e "Installation of [misc/bash-completion] => [$HOME/.local/share/bash-completion/completions/$REPO_PROJECT] is Successful." || \
        echo -e "Error during installation of [misc/bash-completion] => [$HOME/.local/share/bash-completion/completions]."
}

install_global()
{
    : "
    Install built files from local repository to system
    "
    # Check if script is running as sudo
    if [[ "$EUID" -ne 0 ]]; then
        echo -e "Please run the script as root (sudo)"
        exit 1
    fi

    # Install binary
    cp ${BIN[@]} $INSTALL_PATH/bin && \
        echo -e "Installation of [${BIN[@]}] => [$INSTALL_PATH/bin] is Successful." || \
        echo -e "Error during installation of [${BIN[@]}] => [$INSTALL_PATH/bin]."

    # Install code documentations
    cp -r doc $INSTALL_PATH/share/doc/$REPO_PROJECT && \
        echo -e "Installation of [doc] => [$INSTALL_PATH/share/doc/$REPO_PROJECT] is Successful." || \
        echo -e "Error during installation of [doc] => [$INSTALL_PATH/share/doc/$REPO_PROJECT]."
    
    # Install manuals
    
    # Install miscelleneous
    ## Bash autocompletion
    cp misc/bash-completion $INSTALL_PATH/share/bash-completion/completions/$REPO_PROJECT && \
        echo -e "Installation of [misc/bash-completion] => [$INSTALL_PATH/share/bash-completion/completions/$REPO_PROJECT] is Successful." || \
        echo -e "Error during installation of [misc/bash-completion] => [$INSTALL_PATH/share/bash-completion/completions]."
}

installer()
{
    : "
    Install built files to system
    "
    # install_user_only
    install_global
}

main()
{
    installer
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
