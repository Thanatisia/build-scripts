#!/bin/env bash
: "
Uninstall/Remove installed project source files from system
"
setup()
{
    : "
    Prepare and setup source directory
    "
    # Source files
    . settings.sh
}

uninstall_user_only()
{
    : "
    Install built files from local repository to user directory
    "
    # Check if binary exists in install folder
    for exec in "${BIN[@]}"; do
        if [[ -f "$HOME/.local/bin/$exec" ]]; then
            # Delete files
            echo -e "Deleting [$exec] from $HOME/.local/bin..."
            rm $HOME/.local/bin/$exec && \
                echo -e "Uninstallation of [$exec] from [$HOME/.local/bin] is Successful." || \
                echo -e "Error during uninstallation of [$exec] from [$HOME/.local/bin]."
        fi
    done

    # Install code documentations
    rm -r $HOME/.local/share/doc/$REPO_PROJECT && \
        echo -e "Uninstallation of [$REPO_PROJECT] => [$HOME/.local/share/doc] is Successful." || \
        echo -e "Error during uninstallation of [$REPO_PROJECT] => [$HOME/.local/share/doc/]."
    
    # Install manuals
    
    # Install miscelleneous
    ## Bash autocompletion
    rm $HOME/.local/share/bash-completion/completions/$REPO_PROJECT && \
        echo -e "Uninstallation of [$REPO_PROJECT] => [$HOME/.local/share/bash-completion/completions] is Successful." || \
        echo -e "Error during uninstallation of [$REPO_PROJECT] => [$HOME/.local/share/bash-completion/completions]."
}

uninstall_global()
{
    : "
    Remove installed package from system
    "
    # Check if script is running as sudo
    if [[ "$EUID" -ne 0 ]]; then
        echo -e "Please run the script as root (sudo)"
        exit 1
    fi

    # Check if binary exists in install folder
    for exec in "${BIN[@]}"; do
        if [[ -f "$INSTALL_PATH/bin/$exec" ]]; then
            # Delete files
            echo -e "Deleting [$exec] from $INSTALL_PATH/bin..."
            rm $INSTALL_PATH/bin/$exec && \
                echo -e "Uninstallation of [$exec] from [$INSTALL_PATH/bin] is Successful." || \
                echo -e "Error during uninstallation of [$exec] from [$INSTALL_PATH/bin]."
        fi
    done

    # Install code documentations
    rm -r $INSTALL_PATH/share/doc/$REPO_PROJECT && \
        echo -e "Uninstallation of [$REPO_PROJECT] from [$INSTALL_PATH/share/doc] is Successful." || \
        echo -e "Error during uninstallation of [$REPO_PROJECT] from [$INSTALL_PATH/share/doc]."
    
    # Install manuals

    # Install miscelleneous
    ## Bash autocompletion
    rm $INSTALL_PATH/share/bash-completion/completions/$REPO_PROJECT && \
        echo -e "Uninstallation of [$REPO_PROJECT] from [$INSTALL_PATH/share/bash-completion/completions] is Successful." || \
        echo -e "Error during uninstallation of [$REPO_PROJECT] from [$INSTALL_PATH/share/bash-completion/completions]."
}

uninstall()
{
    : "
    Remove installed package from user/system
    "
    # uninstall_user_only
    uninstall_global
}

main()
{
    uninstall
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
