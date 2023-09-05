# feh

## Information
### Background
```
feh is a fast and lightweight X11 image viewer aimed mostly at console users. Unlike most other viewers, it does not have a fancy GUI, but simply displays images. It is controlled via commandline arguments and configurable key/mouse actions
```

### Project
+ Author: finalrewind
+ Project: feh
- Code Repositories
    + Website: feh.finalrewind.org
    + Repository: https://git.finalrewind.org/feh

## Setup
### Dependencies
+ git
+ build-essential : apt equivalent of base-devel for arch (pacman)
+ libcurl4-openssl-dev 
+ libx11-dev 
+ libxt-dev 
+ libimlib2-dev 
+ libxinerama-dev 
+ libjpeg-progs

### Pre-Requisites

#### Download the latest tarball
- Download tarball
    ```console
    wget https://feh.finalrewind.org/feh-[version].tar.bz2
    ```
- Untar and extract tarball
    ```console
    tar -xjf feh-[version].tar.bz2
    ```
- Change directory into folder
    ```console
    cd feh-[version]
    ```

#### Cloning Repository
- Clone Repository
    ```console
    git clone https://git.finalrewind.org/feh
    ```

- Change directory into folder
    ```console 
    cd feh
    ```

#### Build/Compile
- Build/Compile source code 
    - using make
        - Options
            + Append 'VERBOSE=true' to display full compiler/linker commands.
            - Append 'STATIC=true' for static compilation.
                + Notice! If using LDAP Authentication, usernames will show as UID number for LDAP users if compiling statically with glibc.
            + Append 'QUIET=true' for less verbose output.
            + Append 'STRIP=true' to force stripping of debug symbols (adds -s linker flag).
            + Append 'ARCH=<architecture>' to manually set the target architecture. If omitted the makefile uses the machine triple (output of -dumpmachine compiler parameter) to detect the target system.
            - Use 'ADDFLAGS' variable for appending flags to both compiler and linker.
                + For example: ADDFLAGS=-march=native might give a performance boost if compiling only for your own system.
            - If g++ is linked to an older version of gcc on your system 
                + specify the correct version by appending CXX=g++-10 or CXX=g++-11.
        ```console
        make {options}=<arguments>
        ```

#### Installation
- Install built binary and files to system
    - Options
        - Append 'PREFIX=/target/dir' to set target; default: /usr/local
            + Notice! Only use "sudo" when installing to a NON user owned directory.
    ```console
    sudo make install
    ```

#### Removal/Uninstallation
- Uninstall from system
    ```console
    sudo make uninstall
    ```

- Remove any object files from source directory
    ```console
    make clean
    ```

## Documentations
### Themes
- The make install command places the default themes in [$PREFIX or /usr/local]/share/btop/themes. 
    + User created themes should be placed in $XDG_CONFIG_HOME/btop/themes or $HOME/.config/btop/themes.
- Self-installed themes such as fonts, fonticons, themes can be recognized

## Wiki
### Snippets and Examples

## Resources

## References
+ [ArchWiki - feh](https://wiki.archlinux.org/title/feh)
+ [finalrewind - feh](https://feh.finalrewind.org/)

## Remarks
