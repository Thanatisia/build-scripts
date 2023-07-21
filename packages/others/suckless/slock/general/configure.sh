: "
Perform configuration for source code
"

configure()
{
    : "
    Perform configurations
    "
    # Initialize Variables
    tmp=""

    # Pause and get user input
    echo -e ""
    read -p "Proceed to configure the source code..." tmp
    echo -e ""

    # Open Editor
    $EDITOR $REPO_PROJECT
}

main()
{
    configure
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    . settings.sh
    main "$@"
fi
