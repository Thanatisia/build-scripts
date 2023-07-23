: "
Patch Management
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

start_patch()
{
    : "
    Start patching the source code (if patch exists)
    "
    # Check if patch file exists
    if [[ -f $PATCH_FILE ]]; then
        # If patch file exists
        # Pause and get user input
        echo -e ""
        read -p "Proceed to apply patch [$PATCH_FILE] to the source code..." tmp
        echo -e ""
        # patch -p0 < $PATCH_FILE
        patch < $PATCH_FILE
    else
        # Patch file does not exist
        echo -e "Patch file [$PATCH_FILE] does not exists."
    fi
}

main()
{
    start_patch
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
