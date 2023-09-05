#!/bin/env bash
: "
Begin building and installation of package
"

run_success()
{
    : "
    Execute when run operation has completed successfully
    "
    msg="$1"
    echo -e "[O] $msg"
}

run_error()
{
    : "
    Execute if run operation has ended with error
    "
    msg="$1"
    echo -e "[X] $msg"
}

run_cleanup()
{
    echo -e "[+] Starting cleanup process"
    ./cleanup.sh
    res="$?"
    if [[ "$res" == "1" ]]; then
        # Error
        exit
    fi
}

run_compile()
{
    echo -e "[+] Starting Compilation"
    ./build.sh
    res="$?"
    if [[ "$res" == "1" ]]; then
        # Error
        exit
    fi
}

run_setup()
{
    echo -e "[+] Starting setup"
    ./setup.sh
    res="$?"
    if [[ "$res" == "1" ]]; then
        # Error
        exit
    fi
}

run_install()
{
    echo -e "[+] Starting installation"
    ./installer.sh
    res="$?"
    if [[ "$res" == "1" ]]; then
        # Error
        exit
    fi
}

main()
{
    echo -e "Starting..."

    run_setup
    run_compile
    run_install

    # Completed
    run_success "Completed."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
