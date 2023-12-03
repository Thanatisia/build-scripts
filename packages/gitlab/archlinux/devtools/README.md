# ArchLinux devtools

## Information
### Project
+ Author: archlinux
+ Project: devtools

- Code Repositories
    + GitHub (Read-only Mirror) : https://github.com/archlinux/devtools
    + GitLab : https://gitlab.archlinux.org/archlinux/devtools

### Summary
```
Tools for ArchLinux package maintainers
```

## Setup
### Dependencies
+ git 
- build-essential (Equivalent to base-devel in pacman)
    + make
+ arch-install-scripts
+ awk
+ bash
+ binutils
+ coreutils
+ diffutils
+ fakeroot
+ findutils
+ grep
+ jq
+ ncurses
+ openssh
+ parallel
+ rsync
+ sed
+ systemd
+ util-linux
+ bzr
+ git
+ mercurial
+ subversion
+ asciidoc (aka a2x)
+ shellcheck

### Pre-Requisites

#### Cloning Repository
- Clone Repository
    ```console
    git clone https://gitlab.archlinux.org/archlinux/devtools
    ```

- Change directory into folder
    ```console 
    cd devtools
    ```

#### Configurations
+ NIL

#### Build/Compile
- Build/Compile source code 
    - Using Makefile
        ```console
        make
        ```

#### Installation
- Install built binary and files to system
    - Using Makefile
        ```console
        sudo make install
        ```

#### Removal
- Uninstall installed files from system
    - Using Makefile
        ```console
        sudo make uninstall
        ```

### Post-Install Setup
- Make your chroot folder to store the chroot root environment
    ```console
    mkdir chroots
    ```

- Create the actual chroot directory within it
    - Using mkarchchroot
        - Explanation
            - mkarchchroot will 
                + create the actual chroot environment - named 'root' - within the folder 'chroots'
                - Afterwhich, the packages and package groups specified - in this case, 'base' - will be bootstrapped and installed into the chroot environment's filesystem
                    + 'base' is the package group that contains the root filesystem, this is necessary to make a working environment
        ```console
        mkarchchroot chroots/root base
        ```

- Edit the mirrorlist within the chroot environment to facilitate the downgrade
    - Explanation
        - Write the line 'Server = https://archive.archlinux.org/repos/[year]/[month]/[date]/$repo/os/$arch' into the mirrorlist of the chroot environment
            - where
                + year = the year of the repository; i.e. 2016
                + month = the month of the repository; i.e. 02 = February
                + date = the date of the repository; i.e. 19
    ```console
    echo 'Server = https://archive.archlinux.org/repos/[year]/[month]/[date]/$repo/os/$arch' > [chroot-environment-path]/root/etc/pacman.d/mirrorlist
    ```

- Enter the chroot environment
    - Explanation
        + This is just basically chroot (Change root)-ing into the newly create ArchLinux filesystem chroot environment as per normal
        - However, in this example
            - We will be using 'arch-chroot' which can be found in the ArchLinux package 'arch-install-scripts' which is effectively a wrapper that 
                + performs several mounts before chroot is ran
    ```console
    sudo arch-chroot [chroot-environment-path]/root [shell]
    ```

- In the chroot environment
    - Update accordingly
        ```console
        pacman -Syu
        ```

## Documentations

## Wiki
### Snippets and Examples
- [Default pacman.conf file](pacman.conf)

## Resources

## References
+ [ArchWiki - Install ArchLinux from an existing Linux](https://wiki.archlinux.org/title/Install_Arch_Linux_from_existing_Linux#Using_pacman_from_the_host_system)

## Remarks

