# Suckless - dmenu

## Information
### Background
```
dmenu is a simple and lightweight but dynamic menu for XOrg that takes in standard input (stdin) and creates a menu/list. 
    - On selection, dmenu will output to the standard output (stdout).

dmenu also has a wrapper named 'dmenu_run' that allows dmenu to be used as an application launcher

Alternatives to dmenu includes
    - rofi : A dynamic application launcher that supports dmenu menu; Similar to dmenu_run
```

### Project file structure
- Important Files
    - config.def.h: Edit to modify the configurations
        + This file will be compiled and built into 'config.h' which is then read into 'dmenu.c' and any other files that requires the configuration file

- Binaries built
    + dmenu      : The menu
    + dmenu_path
    + dmenu_run  : The application launcher
    + stest

## Setup
### Dependencies
+ coreutils
+ fontconfig
+ freetype2
+ glibc
+ git
+ make
- To run
    - Display Server
        + libx11 : X11/xorg server
        + libxft
        + libxinerama
- Build/Compilation essentials for development
    - GNU packages
         - Using package manager
            - apt-based
                ```console
                sudo apt install build-essential
                ```
            - pacman-based
                ```console
                sudo pacman -S base-devel
                ```       
        - make
            - Using package manager
                - apt-based
                    ```console
                    sudo apt install make
                    ```
                - pacman-based
                    ```console
                    sudo pacman -S make
                    ```
        - gcc
            - Using package manager
                - apt-based
                    ```console
                    sudo apt install gcc
                    ```
                - pacman-based
                    ```console
                    sudo pacman -S gcc
                    ```

### Pre-Requisites
- Edit the configuration files according to what you like
    - Files
        + config.def.h : To edit the configuration of dmenu
        + config.mk    : To edit the makefile specifications to match your local setup (dmenu is installed into the /usr/local namespace by default)

### Manually build/compile the source file
- Using Makefile
    ```console
    make
    ```

### Clean temporarily-created files
- Using Makefile
    ```console
    make clean
    ```

### Install binary and files to system
- Using Makefile
    ```console
    sudo make install
    ```

### Uninstall/remove binary and files from system
- Using Makefile
    ```console
    sudo make uninstall
    ```

## Documentations
### Synopsis/Syntax

### Parameters

### Usage

## Wiki

## Customization and Configuration

## Resources

## References
+ [ArchLinux - packages - extra - x86_64 - dmenu](https://archlinux.org/packages/extra/x86_64/dmenu/)
+ [ArchWiki - Dmenu](https://wiki.archlinux.org/title/dmenu#:~:text=dmenu%20is%20a%20fast%20and,line%20is%20printed%20to%20stdout.)

## Remarks
