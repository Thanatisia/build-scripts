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

installer()
{
    : "
    Build package from source
    "
    sudo ${CC} ${CFLAGS} install
}

main()
{
    installer
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
