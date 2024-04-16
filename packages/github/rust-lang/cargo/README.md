# rust-lang/cargo

## Information
### Description
+ The Rust Package Manager

### Project
+ Author: rust-lang
+ Project: cargo
- Code Repositories and Mirrors
    + GitHub  : https://github.com/rust-lang/cargo

## Setup
### Dependencies
- Building/Development Essentials
    + alpine-sdk      : For apk/alpine-based
    + base-devel      : For pacman-based
    + build-essential : For apt-based
+ cargo : Cargo is distributed by default with rust, so if you have rustc installed locally, you probably also have cargo installed locally
+ rustc
+ make
+ git
+ gcc
+ cc
+ pkg-config
+ libiconv
+ libcurl — Used for network transfers.
+ libgit2 — Used for fetching git dependencies.
+ libssh2 — Used for SSH access to git repositories.
+ libz (aka zlib) — Used for data compression.

### Pre-Requisites

#### Cloning Repository
- Clone Repository
    ```console
    git clone https://github.com/rust-lang/cargo
    ```

- Change directory into folder
    ```console 
    cd cargo
    ```

#### Configurations
+ NIL

#### Build/Compile
- Build/Compile source code 
    - Using cargo
        ```bash
        cargo build --release
        ```

#### Installation
- Install built binary and files to system
    - Install
        ```bash
        ```

#### Removal/Uninstallation
- Uninstall from system
    - Delete executables from system $PREFIX
        ```bash
        sudo rm -r $PREFIX/bin/cargo
        ```

## Documentations
### Configurations
- Configuration Options
    + `--set install.prefix=[target-installation-path]` : Specify the custom install root directory/path
    + `--set build.extended=false` : Disable the default behaviour of including cargo in the build process
    - `--set build.build=[build-ABI-triple]` : Specify the target Build ABI triple of your environment
        - GNU ABI (using GCC)
            + i686-pc-windows-gnu
            + x86_64-pc-windows-gnu
        - The MSVC ABI
            + i686-pc-windows-msvc
            + x86_64-pc-windows-msvc

- Usages
    - Set Installation path PREFIX
        ```console
        ./configure --set install.prefix=/usr/local
        ```
    - Set custom build ABI
        - Windows GNU
            ```console
            ./configure --set build.build=x86_64-pc-windows-gnu
            ```

### Build System

> using x.py

- Description
    + x.py is rust's primary build system
    + rust has make as well, but it is a wrapper that executes x.py

- Targets
    - build : Build all source files into binary/executables
        + rustc : The Rust Compiler
        + rustdoc : The Rust API documentation tool
        + cargo : You can disable installing this by passing '--set build.extended=false' to './configure'
    - doc : Build all documentations from source
        - The generated documentation will appear under the 'doc/' folder in the 'build/' directory for the ABI used
            + ABI directory: 'build/[architecture]-[platform]-[operating-system]-[build-process]'
            - i.e.
                - if the ABI was 'x86_64-pc-windows-msvc/'
                    + The directory will be 'build\x86_64-pc-windows-msvc\doc'
    - install : Install all binaries into system
        - This will install all the binaries and documentations into the system
            - When the installation is completed, install will place several programs into `$PREFIX/bin`
                + rustc : The Rust Compiler
                + rustdoc : The Rust API documentation tool
                + cargo : You can disable installing this by passing '--set build.extended=false' to './configure'

## Wiki
### Snippets and Examples

## Resources

## References
+ [GitHub - rust-lang/rust - INSTALL](https://github.com/rust-lang/rust/blob/master/INSTALL.md)

## Remarks

