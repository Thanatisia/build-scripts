# QEMU Setup: Compilation - Compile all QEMU machine types

## Information
### Project
+ Author: qemu
+ Project: qemu

- Code Repositories
    + GitHub  : https://github.com/qemu/qemu
    + GitLab  : https://gitlab.com/qemu-project/qemu.git/
    + QEMU Git: https://git.qemu.org/git/qemu.git

## Setup
### Dependencies
+ git 
+ build-essential (Equivalent to base-devel in pacman)
+ ninja-build 
+ libepoxy-dev 
+ libdrm-dev 
+ libgbm-dev 
+ libx11-dev 
+ libvirglrenderer-dev 
+ libpulse-dev 
+ libsdl2-dev 
+ libglib2.0-dev 
+ libfdt-dev 
+ libpixman-1-dev 
+ zlib1g-dev 
+ libepoxy-dev 
+ libdrm-dev 
+ libgbm-dev 
+ libx11-dev 
+ libvirglrenderer-dev 
+ libpulse-dev 
+ libsdl2-dev

### Pre-Requisites

#### Cloning Repository
- Clone Repository
    ```console
    git clone https://git.qemu.org/git/qemu.git
    ```

- Change directory into folder
    ```console 
    cd qemu
    ```

- Initialize git submodule list
    ```console
    git submodule init
    ```

- Update folder and clone all submodules recursively
    ```console
    git submodule update --recursive
    ```

#### Configurations
- Configure meson with options required to be executed during build/compilation
    - Options
        + Compile all QEMU machine types
            ```console
            ./configure --enable-sdl  --enable-opengl --enable-virglrenderer --enable-system --enable-modules --audio-drv-list=pa --enable-kvm
            ```
        + Compile x86_64 for ARM processor
            ```console
            ./configure --cross-prefix=arm-linux-gnueabihf- --prefix=/usr/local --target-list="i386-softmmu i386-linux-user x86_64-softmmu x86_64-linux-user" --enable-linux-user --enable-user --enable-system
            ```

#### Build/Compile
- Build/Compile source code 
    - Using ninja
        ```console
        ninja -C build
        ```

#### Installation
- Install built binary and files to system
    - Using ninja
        ```console
        sudo ninja install -C build
        ```

## Documentations

## Wiki
### Snippets and Examples

## Resources

## References
+ [QEMU Wiki - Hosts - Linux](https://wiki.qemu.org/Hosts/Linux)
+ [Raspberry Pi Forums - Raspberry Pi 4 and QEMU (x86/64)](https://forums.raspberrypi.com/viewtopic.php?t=246886)

## Remarks
