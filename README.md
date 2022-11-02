# Build scripts Compilation

Collection/Compilation of package build/compile scripts that will simplify the manual installation/compilation process by basically automatically

    * Prepare Dependencies
    * downloading/clones the source code,
    * Changing directory into the source code
    * Building the source code
    * Installing the source code
    * Cleaning up the temporary files

The collection aims to be an all-in-one place for scripts that are portable/modular in that users can just open up, edit a few variables/installation statements according to the manual compilation/installation steps specified by the maintainers
and it will be usable as a simplified autobuilder (similar to ArchLinux's AUR PKGBUILD scripts but in an all-in-one repository and shellscript format).


## Disclaimer
 * Note that the above are just generic steps I simplified based off most that I saw, these steps will change from developer to developer.
 * This is not a replacement for Makefile buildscripts in of itself, this is realistically more of an add-on that aims to be a form of standardization to make manual source code compilation easier to do.
 * Ensure that Terms and Conditions for projects and repositories are followed in the case whereby licensing is in place (i.e. GPL3, MIT License, Apache etc)
 * Do read the script before using it, as a Rule of Thumb, it is generally not recommended to pipe to bash directly due to safety and security unless you have already done so


## FAQ
1. How can you help?
    + Please refer to the [CONTRIBUTING.md](CONTRIBUTING.md) file for more details on how to help, but
    - The following are a summary on things to take note of when contributing to ensure competency and standardization so as to maintain usability.
        1. Use similar variable naming convention schemes (pretty much good quality naming) for understandability
            - Examples
                + CC : stands for Cross Compiler, this is based off Makefile's use of the CC naming convention scheme, use this for all installers, make commands or compiler/builders.
                + CFLAGS : Stands for Compiler flags, this is also based off Makefile's compiler scheme, use this to indicate your installation/compilation flags
                + DEPENDENCIES : Self-explanatory, this is for all dependencies to install in your distribution
        2. Use comments if it's not a commonly-used function
            - Examples of Commonly-used Functions
                + compile()/build() : For running the manual compilation/installation process
                + install() : To install the source code using their provided makefile/build script.
                + clean()/cleanup() : For cleaning up the source code folder and removing temporary files generated from the compilation

## Setup
### Pre-Requisites
 * Network Connection

### Dependencies
> These are some basic requirements/dependencies for the most part based on what I see
+ git : For git cloning as most source codes are from git remote repositories
+ curl : There may be install scripts that are in individual files
+ make : Makefiles requires the make command to make which is what most build scripts uses;
    - Pacman Package Manager => install "base-devel" package

## Documentation
### Usage
- Simplified Usage
    - Assuming the following:
        * Distribution : Debian
        * Package Manager : apt
    - via Curl
        - Viewing the target script
            ```console
            curl -sSL https://raw.githubusercontent.com/Thanatisia/build-scripts/[branch-name]/packages/[author-name]/[application-name]/[package-manager]/compile.sh
            ```
        - Executing the target script without downloading
            + Please do this only if you have already read the script.
            ```console
            curl -sSL https://raw.githubusercontent.com/Thanatisia/build-scripts/[branch-name]/packages/[author-name]/[application-name]/[package-manager]/compile.sh | bash
            ```
        - Downloading the target script
            ```console
            curl -O -L https://raw.githubusercontent.com/Thanatisia/build-scripts/[branch-name]/packages/[author-name]/[application-name]/[package-manager]/compile.sh
            ```

## Wiki
### Repository Structure
```
            root/
            |
            |-- packages/
                |
                |-- [author-name]/
                    |
                    |-- [application-name]/
                        |
                        |-- apt/ : For apt-based (i.e. Debian) dependencies
                        |-- pacman/ : For pacman-based (i.e. ArchLinux) dependencies
```

### TODO List/Pipeline
> The following are plans/possible ideas
+ [ ] Migrating into a standalone author organization and repository for this project


