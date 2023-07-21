: "
Obtaining source code
"

prepare()
{
    : "
    Prepare for startup
    "
    # Check directories and files
    SCRIPTS=("setup.sh" "settings.sh" "configure.sh")

    # Loop through all scripts and check
    for script in "${SCRIPTS[@]}"; do
        # Check if script exists
        if [[ ! "$script" ]]; then
            # Script doesnt exists
            curl -L -O "https://raw.githubusercontent.com/Thanatisia/build-scripts/tree/main/packages/github/$REPO_AUTHOR/$REPO_PROJECT/$script"
        fi
    done

    # Source settings file
    . settings.sh
}

obtain_dependencies()
{
    : "
    Install pre-requisites and dependencies
    "

}

obtain_repository()
{
    git clone $REPO_URL
}

main()
{
    : "
    Main runner
    "
    prepare
    obtain_dependencies
    obtain_repository
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
