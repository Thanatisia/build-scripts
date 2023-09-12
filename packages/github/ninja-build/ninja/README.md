# ninja

## Information
### Background
```
Version Control System created by Linus Torvalds that is widely used globally
Small build system with a focus on speed.
```

### Project
+ Author: ninja-build
+ Project: ninja
+ Website: https://ninja-build.org/
- Code Repositories and Mirrors
    + GitHub  : https://github.com/ninja-build/ninja

## Setup
### Dependencies
+ python3  : Ninja uses configure.py which requires python
+ git
+ build-essential : apt equivalent of 'base-devel' for arch (pacman)
+ make
+ gcc
+ g++
+ asciidoc : For writing ASCII documentations
+ re2c
+ doxygen  : For building application Manuals
+ graphviz : For building UML and use-case documentation development

### Pre-Requisites

#### Cloning Repository
- Clone Repository
    + Only the master/main branch
    ```console
    git clone --depth 1 https://github.com/ninja-build/ninja
    ```

- Change directory into folder
    ```console 
    cd ninja
    ```

#### Configurations
- Ninja is built using itself. 
    - Thus, you will need to bootstrap the first binary, which will 
        - first, compile all non-test source files together, 
            + then re-builds Ninja using itself. 
        + You should end up with a ninja binary (or ninja.exe) in the project root.

- Run configure.py to generate the `build.ninja` files used to build ninja
    - It accepts various flags to adjust build parameters
        + Run `./configure.py --help` for more configuration options
    + The primary build target of interest is ninja
    ```console
    ./configure.py --bootstrap. 
    ```

- Perform unit test with the bootstrapped ninja binary
    ```console
    ninja_test
    ```

- To test the binary
    ```console
    ./ninja --version
    ```

#### Build/Compile
- Build/Compile manual
    - using ninja
        + Uses asciidoc to compile the manuals
        - Rules/Targets
            + manual
        ```console
        ./ninja manual
        ```
- Build/compile code documentation
    - using ninja
        + Uses doxygen to create UML code documentations
        - Rules/Targets
            + doxygen
        ```console
        ./ninja doxygen
        ```

#### Installation
- Copy compiled/built files to system
    - Notes
        - `$PREFIX` refers to the installation path to install the files to
            + Default: `/usr/local`
    - Binary 'ninja' to `$PREFIX/bin`
    - Code Documentation directory 'doc' to '$PREFIX/share/doc/ninja'
    - Bash completion in 'misc/bash-completion' to '$PREFIX/share/bash-completion/completions/ninja'

#### Removal/Uninstallation
- Uninstall from system
    - Binary 'ninja' from `$PREFIX/bin`
    - Code Documentation directory 'ninja' from '$PREFIX/share/doc'
    - Bash completion from '$PREFIX/share/bash-completion/completions/ninja'

- Clean/Remove any object files from source directory
    ```console
    ./ninja -t clean
    ```

## Documentations


## Wiki
### Snippets and Examples

## Resources

## References
+ [ninja-build Manual](https://ninja-build.org/manual.html)

## Remarks
