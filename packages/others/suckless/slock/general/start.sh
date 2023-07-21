: "
Main Launcher
"

main()
{
    ./setup.sh # Setup process
    ./configure.sh # Editing/configuration process
    ./build.sh # Make/Build Source Code (if any)
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
