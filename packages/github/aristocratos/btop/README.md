# btop++

## Information
### Background
```
TUI variant of top; Resource monitor that shows usage and stats for processor, memory, disks, network and processes.

C++ version and continuation of bashtop and bpytop.
```

### Project
+ Author: aristocratos 
+ Project: btop++
- Code Repositories
    + GitHub  : https://github.com/aristocratos/btop

## Setup
### Dependencies
+ git 
+ build-essential : apt equivalent of base-devel for arch (pacman)
+ coreutils 
+ sed 
+ gcc-11 
+ g++-11

### Pre-Requisites

#### Cloning Repository
- Clone Repository
    ```console
    git clone https://github.com/aristocratos/btop.git
    ```

- Change directory into folder
    ```console 
    cd btop
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

- (Optional) Always run as root
    - Set SUID bit to make btop always run as root (or other users)
        + No need for sudo to enable signal sending to any process and to prevent /proc read permissions problems on some systems.
        + Run after make install and use same PREFIX if any was used at install.
        + Set 'SU_USER' and 'SU_GROUP' to select user and group, default is root and root
    ```console
    sudo make setuid
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

- Remove all object files, binaries and created directories in source directory
    ```console
    make distclean
    ```

## Documentations
### Themes
- Btop++ uses the same theme files as bpytop and bashtop (some color values missing in bashtop themes) .
- The make install command places the default themes in [$PREFIX or /usr/local]/share/btop/themes. 
    + User created themes should be placed in $XDG_CONFIG_HOME/btop/themes or $HOME/.config/btop/themes.
- Self-installed themes such as fonts, fonticons, themes can be recognized

## Wiki
### Snippets and Examples

## Resources

## References
+ [GitHub - aristocratos/btop - compilation: Linux](https://github.com/aristocratos/btop#compilation-linux)

## Remarks
