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

uninstall()
{
    : "
    Remove installed package from system
    "
    # Check if binary exists in install folder
    for exec in "${BIN[@]}"; do
        if [[ -f "$INSTALL_PATH/bin/$exec" ]]; then
            # Delete files
            echo -e "Deleting [$exec] from $INSTALL_PATH/bin..."
            rm $INSTALL_PATH/bin/$exec
        fi
    done
}

main()
{
    uninstall
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup
    main "$@"
fi
