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

configure()
{
    : "
    Primary/main configuration body
    "
    make configure
    ./configure ${CONFIGURE_OPTS}
}

main()
{
    prepare
    configure
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
