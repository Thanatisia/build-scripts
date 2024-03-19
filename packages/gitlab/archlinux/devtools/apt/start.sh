#!/bin/env bash
: "
Main Launcher
"

main()
{
    ./setup.sh # Setup process

    # Pause and get user input
    echo -e ""
    read -p "Proceed to configure the source code..." tmp
    echo -e ""
    ./configure.sh # Editing/configuration process

    # Pause and get user input
    echo -e ""
    read -p "Proceed to build the source code..." tmp
    echo -e ""
    ./build.sh # Make/Build Source Code (if any)

    # Pause and get user input
    echo -e ""
    read -p "Proceed to install to system..." tmp
    echo -e ""
    ./installer.sh # Install built package to system
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
