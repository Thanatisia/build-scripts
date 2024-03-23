: "
Perform configuration for source code
"

prepare()
{
    : "
    Perform configurations
    "
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

configure_build_generic()
{
    : "
    Just configure
    "
}

configure()
{
    : "
    Primary/main configuration body
    "
    configure_build_generic
}

main()
{
    prepare
    configure
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
