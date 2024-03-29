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
    - Current WIP
        1. You may have noticed that in certain build folders, there exists 2 files - 'compile.py' and a Makefile.
            - compile.py is a prototype of my current Work-in-Progress universal build script format idea that i'm trying to make. 
            - The goal is to make a template build script that is able to also allow you to write build scripts, unlike the current usage of shellscript which limits things to just Linux (shell).
            - The Makefile coexists with the compile.py script, essentially a wrapper that automates and makes the usage of compile.py easier.
            - The plan is to test this and if it works and is a positive concept
                + I will then proceed with Phase 2: Porting
                + I will port the compile.py script to either Rust or golang (still deciding, do give me your input)

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
### Obtaining
- Individually
    - Assuming the following:
        * Repository Site : github
        * Distribution : Debian
        * Package Manager : apt
    - via Curl
        - Viewing the target script
            ```console
            curl -sSL https://raw.githubusercontent.com/Thanatisia/build-scripts/[branch-name]/packages/github/[author-name]/[application-name]/[package-manager]/compile.sh
            ```
        - Executing the target script without downloading
            + Please do this only if you have already read the script.
            ```console
            curl -sSL https://raw.githubusercontent.com/Thanatisia/build-scripts/[branch-name]/packages/github/[author-name]/[application-name]/[package-manager]/compile.sh | bash
            ```
        - Downloading the target script
            ```console
            curl -O -L https://raw.githubusercontent.com/Thanatisia/build-scripts/[branch-name]/packages/github/[author-name]/[application-name]/[package-manager]/[script-name]
            ```
- Download all scripts using the `dl_template.sh` automate script
    - Obtain script
        - Specific project
            ```console
            curl -O -L https://raw.githubusercontent.com/Thanatisia/build-scripts/[branch-name]/packages/github/[author-name]/[application-name]/[package-manager]/dl_template.sh
            ```
        - Template and manually edit
            ```console
            curl -O -L https://raw.githubusercontent.com/Thanatisia/build-scripts/[branch-name]/docs/contributions/templates/shellscript/dl_template.sh
            ```
    - Edit the script according to what project you need
        ```console
        $EDITOR dl_template.sh
        ```
    - Change permission of script
        ```console
        chmod u+x dl_template.sh
        ```
    - Execute script to download all the files
        ```console
        ./dl_template.sh
        ```

## Wiki
### Source Files, Templates
+ Please refer to [CONTRIBUTING](CONTRIBUTING.md) for documentation on all of the scripts, variables etc

### Source Code Repositories
```
Source code/git remote repositories are File/FTP Servers that holds the source code for their respective organizations and/or, including Distributed Version Control platforms such as GitHub, GitLab, Bitbucket etc.

Packages located under 'others' will generally be placed in multi-versions, thus, those folders should contain an additional ["version-number"] folder in the package manager folder as shown in the repository structure.
```
- Distributed Version Control Platforms
    + GitHub
    + GitLab
    + BitBucket
- Others
    + linux : git kernel.org

### Repository Structure
```
            root/
            |
            |-- packages/
                |
                |-- github/ : For GitHub-repositories
                    |
                    |-- [author-name]/
                        |
                        |-- [application-name]/
                            |
                            |-- apt/ : For apt-based (i.e. Debian) dependencies
                            |-- pacman/ : For pacman-based (i.e. ArchLinux) dependencies
                |
                |-- others/ : For other Remote repositories for individual hosts (i.e. linux kernel has the git.kernel.org)
                    |
                    |-- [author-name]/
                        |
                        |-- [application-name]/
                            |
                            |-- apt/ : For apt-based (i.e. Debian) dependencies
                                |
                                |-- (OPTIONAL) [version-number]/
                            |
                            |-- pacman/ : For pacman-based (i.e. ArchLinux) dependencies
                                |
                                |-- (OPTIONAL) [version-number]/
```

### TODO List/Pipeline
> The following are plans/possible ideas
+ [ ] Migrating into a standalone author organization and repository for this project
+ [ ] Finalizing a standardized filesystem structure for the codebase that is efficient for the user
+ [ ] Port compile.py from prototyping in python to either Rust or golang, whichever is more efficient for portable shellscript
+ [ ] Create a better "package manager"/download script to improve the UX of the repository/project

## Notes
- Please do [Contact Me](#contacts) if you would like to
 * Talk about Tech
 * Talk about the repository
 * Project Ideas
 * Bugs
 * Issues
 * Contributions

## Contacts
[![Twitter](https://img.shields.io/badge/Twitter-blue?logo=Twitter&logoColor=white)](https://twitter.com/phantasu)

