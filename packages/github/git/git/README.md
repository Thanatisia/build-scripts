# git

## Information
### Background
```
Version Control System created by Linus Torvalds that is widely used globally
```

### Project
+ Author: git
+ Project: git
- Code Repositories and Mirrors
    + GitHub  : https://github.com/git/git

## Setup
### Dependencies
+ build-essential : apt equivalent of base-devel for arch (pacman)
+ make
+ gcc
+ g++
+ asciidoc : For writing ASCII documentations
+ libcurl4-openssl-dev : For curl

### Pre-Requisites

#### Cloning Repository
- Clone Repository
    + Only the master branch
    ```console
    git clone --depth 1 https://github.com/git/git
    ```

- Change directory into folder
    ```console 
    cd git
    ```

#### Configurations
- Configure with options required to be executed during build/compilation 
    - Use autoconf to generate ./configure script
        ```console
        make configure
        ```
    - Configure and setup install paths
        - Options
            + --prefix : Specify the install path
        ```console
        ./configure --prefix=/usr/local
        ```

#### Build/Compile
- Build/Compile source code 
    - using make
        - Rules/Targets
            + all : Build all source files to binary
            + doc : Build all documentations
        ```console
        make all doc
        ```

#### Installation
- Install built binary and files to system
    - Rules/Targets
        + install : Install all binaries into system
        + install-doc : Install all documentations to the system
        + install-html : Install all generated HTML files to the system
    ```console
    sudo make install install-doc install-html
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


## Wiki
### Snippets and Examples

## Resources

## References
+ [GitHub - git/git - INSTALL](https://github.com/git/git/blob/master/INSTALL)

## Remarks
