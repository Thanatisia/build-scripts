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
    ./configure
}

configure_build_all()
{
    : "
    Configure build for all processors
    "
    ./configure --enable-sdl  --enable-opengl --enable-virglrenderer --enable-system --enable-modules --audio-drv-list=pa --enable-kvm
}

configure_build_arm()
{
    : "
    Configure build for x86_64 processors
    "
    ./configure --cross-prefix=arm-linux-gnueabihf- --prefix=/usr/local --target-list="i386-softmmu i386-linux-user x86_64-softmmu x86_64-linux-user" --enable-linux-user --enable-user --enable-system
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
