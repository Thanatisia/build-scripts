#!/bin/env bash
: "
Begin building and installation of package
"

# Current script variable
SCRIPTS=(setup.sh compile.sh installer.sh)

main()
{
    echo -e "Starting..."

    # Source scripts
    for script_pos in "${!SCRIPTS[@]}"; do
        # Check if script exists
        script="${SCRIPTS[$script_pos]}" # Get current script
        echo -e "Script Number: $script_pos"
        echo -e "Script Name: $script"
        if [[ -f "$script" ]]; then
            # If script exists, source
            case "$script" in
                "cleanup.sh")
                    echo -e "[+] Starting cleanup process"
                    ./$script
                    res="$?"
                    if [[ "$res" == "1" ]]; then
                        # Error
                        echo -e "Error with cleanup"
                        exit
                    fi
                    ;;
                "compile.sh")
                    echo -e "[+] Starting Compilation"
                    ./$script
                    res="$?"
                    if [[ "$res" == "1" ]]; then
                        # Error
                        echo -e "Error with compilation"
                        exit
                    fi
                    read -p '[O] Compilation completed.' tmp
                    ;;
                "installer.sh")
                    echo -e "[+] Starting installation"
                    ./$script
                    res="$?"
                    if [[ "$res" == "1" ]]; then
                        # Error
                        echo -e "Error with installing"
                        exit
                    fi
                    ;;
                "setup.sh")
                    echo -e "[+] Starting setup"
                    ./$script
                    res="$?"
                    if [[ "$res" == "1" ]]; then
                        # Error
                        echo -e "Error with setup"
                        exit
                    fi
                    ;;
                *)
                    # Invalid script
                    echo -e "[+] Invalid script [$script], skipping..."
                    ;;
            esac

            # new line
            echo -e ""
        fi
    done

    # Completed
    echo -e "[O] Completed."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
