#!/bin/env bash
: "
Obtaining source code
"

prepare()
{
    : "
    Prepare for startup
    "
    # Check directories and files
    SCRIPTS=("build.sh" "configure.sh" "installer.sh" "setup.sh" "settings.sh" "start.sh" "uninstaller.sh")

    # Loop through all scripts and check
    for script in "${SCRIPTS[@]}"; do
        # Check if script exists
        if [[ ! "$script" ]]; then
            # Script doesnt exists
            curl -L -O "https://raw.githubusercontent.com/Thanatisia/build-scripts/tree/main/packages/others/$REPO_AUTHOR/$REPO_PROJECT/apt/$script"
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
    sudo apt install "${DEPENDENCIES[@]}"
}

obtain_repository()
{
    # Clone git repository
    git clone $REPO_URL

    # Change directory into repository
    cd ${REPO_PROJECT}
}

prepare_repository()
{
    # Initialize git submodule contents
    ## 2>&1 : Redirect stderr to stdout
    echo -e "Initializing git submodules..."
    git submodule init 2>&1

    # Update and clone all git submodules recursively
    ## 2>&1 : Redirect stderr to stdout
    echo -e "Cloning all git submodules..."
    git submodule update --recursive 2>&1
}

main()
{
    : "
    Main runner
    "
    prepare
    obtain_dependencies
    obtain_repository
    # prepare_repository
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
