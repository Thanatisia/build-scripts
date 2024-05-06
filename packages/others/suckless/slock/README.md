# Suckless - slock

## Information
### Package 
+ Repository URL: https://git.suckless.org/slock

### Background
```
slock is the Simple X Display Locker; a Screen Locker / Lockscreen. This is supposedly the simplest X screen locker according to Suckless

Alternatives to includes
    - i3lock
    - xlock
```

### Project file structure
- Important Files
    - config.h: Edit to modify the configurations

- Binaries built
    + slock

## Setup
### Dependencies
+ git
+ make
- To run
    - Display Server
        - xorg server
            + libxext
            + libxrandr
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
        + config.h : To edit the configuration of dmenu
        + config.mk    : To edit the makefile specifications to match your local setup (dmenu is installed into the /usr/local namespace by default)

### Obtaining
- Clone git repository
    ```console
    git clone https://git.suckless.org/slock
    ```

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

### Autostart
- Lock screen after a specific period of user inactivity/timeout
    - Using xautolock
        ```console
        xautolock -time [timeout] -locker slock
        ```

## Documentations
### Synopsis/Syntax
```console
slock
```

### Parameters

### Usage

## Wiki

## Customization and Configuration
### Environment Variables
- System
    + EDITOR: Specify the target editor to use
- Project/Repository
    + REPO_DOMAIN="http://repository.domain" : Specify the domain of the project repository
    + REPO_PROJECT="project-name" : Specify the name of the project's repository 
    + REPO_URL=$REPO_DOMAIN/$REPO_PROJECT : Specify the URL of the project repository
- Patching
    + PATCH_FILE="path/to/patch/file.diff": Specify the target patch file's directory

## Resources

## References
+ [Reddit - Suckess - How do I patch suckless software as a newbie](https://www.reddit.com/r/suckless/comments/spc9k2/how_do_i_patch_suckless_software_as_a_newbie/)

## Remarks
