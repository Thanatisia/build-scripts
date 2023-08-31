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
    Build package from source for user only
    "
    TARGETS=("${@}")
    ${CC} ${TARGETS[@]}
}

install_global()
{
    : "
    Build package from source with PREFIX
    "
    TARGETS=("${@}")
    sudo ${CC} ${CFLAGS} ${TARGETS[@]}
}

installer()
{
    : "
    Build package from source
    "
    install_global install install-doc install-html
}

main()
{
    installer
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
