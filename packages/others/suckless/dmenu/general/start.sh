: "
Main Launcher
"

main()
{
    ./setup.sh # Setup process
    ./configure.sh # Editing/configuration process
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
