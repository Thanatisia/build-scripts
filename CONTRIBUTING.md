# CONTRIBUTING

Please follow these steps when contributing to the repository.

## Some Steps to follow
 * Fork the repository to your account
 * Pull the latest changes to your main branch
 * Create a new branch named "author-your_changes"
 * Make changes
 * Commit to your branch
 * Create Pull Requests
    - Specify in your Pull Request
        * Date
        * Time
        * Author Name
        * Package Name
        * Target package manager
        * Base Distribution (OPTIONAL)
        * your changes made
        * Description and information to note


## Development
- Use similar variable naming convention schemes (pretty much good quality naming) for understandability
    - Examples
        + CC : stands for Cross Compiler, this is based off Makefile's use of the CC naming convention scheme, use this for all installers, make commands or compiler/builders.
        + CFLAGS : Stands for Compiler flags, this is also based off Makefile's compiler scheme, use this to indicate your installation/compilation flags
        + DEPENDENCIES : Self-explanatory, this is for all dependencies to install in your distribution

- Use comments if it's not a commonly-used function
    - Examples of Commonly-used Functions
        + compile()/build() : For running the manual compilation/installation process
        + install() : To install the source code using their provided makefile/build script.
        + clean()/cleanup() : For cleaning up the source code folder and removing temporary files generated from the compilation

## Filesystem Structure
- Please place the files into the appropriate folders
    - Version Number
        + Packages located under any of the distributed version control platforms [GitHub, GitLab, BitBucket, etc] typically have the source code for the latest version up, thus, they do not necessarily need to contain an addition ["version-number"] folder in the package manager
        + Packages located under 'others' will generally be placed in multi-versions, thus, those folders should contain an additional ["version-number"] folder in the package manager folder as shown in the repository structure.

## Templates
### Template Categories
> Please use the following templates for your scripts corresponding to the following header types
+ [GitHub](#github) : For all github-sourced/related repositories. These generally contains the latest build/version for the project.
+ [Others](#others) : For other distributed, remote repository websites (i.e. Bitbucket/Gitlab/self-hosted organization mirrors). These are typically seperated according to version numbers as the mirrors may seperate each release as version numbers within seperate folders.

### Components
> Generally, every template type should contain the following components
- Variables
    - Build Information
        - CC           : The global Cross Compiler. stemming from Makefile (make), this variable will contain the compiler/builder/runner/interpretor used to generate the program binary and/or script.
            + Type: String
        - CFLAGS       : (OPTIONAL) The global Compiler flags. stemming from Makefile (make), this variable will contain the flags to parse with the Cross Compiler. This is optional and can be left empty if the build script creator wishes to set individual compiler flags in the functions seperately.
            + Type: String
        - DEPENDENCIES : Specify all dependencies and required packages to build/install; used generally in the function `install_dependencies`
            + Type: List
    - Package Information
        - PKG_AUTHOR   : Specify the package/project author
            + Type: String
        - PKG_NAME     : Specify the package/project name
            + Type: String
        - SRC_URL      : Specify the URL of the project's repository
            + Type: String; Use List if you require various repository sources (WIP to make implementations accept List)
        - BIN_NAMES    : Specify the names of the binaries that the project provides
            + Type: List
- Functions
    + source_files         : Source all settings files you would like to use
    + install_dependencies : Install all dependencies, create files/folders required for the script
    + obtain_repository    : Obtain the source code; i.e. clone git repository
    + setup         : The setup function, used for installing/building pre-requisites, definitions etc before the primary build/make process
    + build         : The primary build/make/compilation process. This is where the general compilation is done after configurations are made.
    + begin_install : The overall installation process of the built/compiled program into the system path and/or other dependencies and folders
    + uninstall_pkg : Contains the uninstallation steps either to reverse the installation process in `begin_install`; or as specified by the maintainer
    + clean         : (Optional) This is the cleanup process/function done only after installation is completed. This can vary from 'make clean' to individual removal. This is up to the recommendation of the project repository maintainer and/or the build script creator if the maintainer did not specify.
    + main          : This is the main launcher runner function that will execute each of the above sections to compile/build the program
- Script files
    1. settings.sh    : Contains all settings, variables to be imported into the parts
    2. setup.sh       : To contain setup processes such as creating workspace/project folder structure, installing dependencies
    3. compile.sh     : To contain compilation/make/build processes and functions for manual building of source codes
    4. installer.sh   : Self-explanatory, this is the installer script to get all manuals, docs, source code, source files into the system applications level (i.e /usr/bin, /usr/sbin)
    5. cleanup.sh     : To contain cleanup processes after the compilation/build/make functions (i.e. make clean)
    6. start.sh       : This is the primary main start script, this script will take the scripts you specified to run, and run them as required
    7. uninstaller.sh : To contain uninstallation processes such as removal of the installed files installed either by the script, or steps provided by the maintainer.
- Makefiles
    - Variables/Arguments
        - Compiler/Interpreter
            + `CC = [cross-compiler]` : Specify the Cross-Compiler used to compile/run the source files
            + `CFLAGS = [flags]` : Specify the compile flags to parse into the cross-compiler
            + `DEPENDENCIES = your dependencies here`: Specify the dependencies to install to the system
        - Package Information
            + `PKG_AUTHOR = project-author` : Specify the project/package author
            + `PKG_NAME = package-name` : Specify the project/package name
            + `BIN_NAME = "binaries - optional"` : Specify the binaries installed (separate all binaries with a space delimiter)
            + `SRC_URL = https://github.com/$(PKG_AUTHOR)/$(PKG_NAME)` : Specify the project repository source URL (github.com = domain)
            + `INSTALL_PATH=/usr/local` : Specify the target PREFIX (installation directory) to install the build files to
            + `CONFIGURE_OPTS="--prefix=$(INSTALL_PATH)"` : Specify the options to configure into the project source codes
    - Recipe/Targets
        + help                 : Display Help message
        + install-dependencies : Install system packages
        + clone                : Clone repository if doesnt exist and initialize submodules
        + configure            : Configure the repository source files before building
        + setup                : Setup pre-requisites
        + build                : Compile/Build everything
        + build-all            : Build the project from Source
        + build-doc            : Build the project documentations from Source
        + install              : Install everything to the host system
        + install-bin          : Install and move the compiled binary to the host system
        + install-html         : Install HTML to the host system
        + install-doc          : Install documentations to the host system
        + uninstall            : Uninstall and remove the installed files from the host system
        + clean                : Clean/Remove all temporarily-generated files from repository
        + enter                : Enter the package repository

### GitHub
#### Makefile
```make
# Makefile
# for Building from Source projects from GitHub

## Variables/Ingredients
### Build Info
CC = make
CFLAGS = 
DEPENDENCIES = your dependencies here

### Package Information
PKG_AUTHOR = project-author
PKG_NAME = package-name
BIN_NAME = "binaries - optional"
SRC_URL = https://github.com/$(PKG_AUTHOR)/$(PKG_NAME)
INSTALL_PATH=/usr/local
CONFIGURE_OPTS="--prefix=$(INSTALL_PATH)"

SHELL := /bin/bash
.PHONY := help install-dependencies setup build install uninstall clean enter
.DEFAULT_RULES := help

## Recipe/Targets
help:
	## Display help message
	@echo -e "[+] help  : Display Help message"
	@echo -e "[+] install-dependencies : Install system packages"
	@echo -e "[+] clone : Clone repository if doesnt exist and initialize submodules"
	@echo -e "[+] configure : Configure the repository source files before building"
	@echo -e "[+] setup : Setup pre-requisites"
	@echo -e "[+] build : Compile/Build everything"
	@echo -e "[+] build-all : Build the project from Source"
	@echo -e "[+] build-doc : Build the project documentations from Source"
	@echo -e "[+] install: Install everything to the host system"
	@echo -e "[+] install-bin : Install and move the compiled binary to the host system"
	@echo -e "[+] install-html : Install HTML to the host system"
	@echo -e "[+] install-doc : Install documentations to the host system"
	@echo -e "[+] uninstall : Uninstall and remove the installed files from the host system"
	@echo -e "[+] clean : Clean/Remove all temporarily-generated files from repository"
	@echo -e "[+] enter : Enter the package repository"

install-dependencies:
	## Install dependencies
    ### apt
	@apt update && apt upgrade && apt install "${DEPENDENCIES[@]}"
    ### pacman
	@pacman -Syu && pacman -S "${DEPENDENCIES[@]}"

clone:
	### Clone repository if doesnt exist and initialize submodules
	@test -d ${PKG_NAME} || git clone "${SRC_URL}"

configure: clone
	## Configure the repository source files before building
	@cd ${PKG_NAME}; ${CC} configure && ./configure ${CONFIGURE_OPTS}

setup: clone configure
	## Setup and perform pre-requisites

build: build-all build-doc
	## Compile/Build everything

build-all: setup
    ## Compile and Build/make the source code into an executable 
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} all && \
		echo -e "[+] Compilation Successful." || \
		echo -e "[-] Compilation Error."

build-doc: setup
	## Compile and Build documentations
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} doc && \
		echo -e "[+] Compilation Successful." || \
		echo -e "[-] Compilation Error."

install: install-bin install-html install-doc
	## Install everything to the host system

install-bin: clone
    ## Install and move the compiled binary to the host system
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} install && \
        echo -e "[+] Executable Installation Successful." || \
        echo -e "[-] Executable Installation Error."

install-html: clone
	## Install HTML to the host system
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} install-html && \
        echo -e "[+] HTML Documentations Installation Successful." || \
        echo -e "[-] HTML Documentations Installation Error."

install-doc: clone
	## Install documentations to the host system
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} install-doc && \
		echo -e "[+] Documentations Installation Successful." || \
		echo -e "[+] Documentations Installation Error."

uninstall: clone
    ## Uninstall and remove installed files from the host system
	### Place your uninstallation/removal steps here

clean: clone
	## Cleanup and remove temporary files generated during compilation
	@cd ${PKG_NAME}; ${CC} clean && \
        echo -e "[+] Cleanup Successful." || \
        echo -e "[-] Cleanup Error."

enter: clone
	## Enter the package repository
	@cd ${PKG_NAME};

```

#### Shellscript (To be decomissioned in favour of Makefiles)
- settings.sh
    ```console
    # Build Info
    CC="your-cross-compiler-or-builder"
    CFLAGS="your-compiler-flags"
    DEPENDENCIES=(package-names)

    # Package Information
    PKG_AUTHOR="author-name"
    PKG_NAME="project-name"
    SRC_URL="repository-source-url"
    BIN_NAMES=(binary-names)
    ```

- setup.sh
    ```console
    source_files()
    {

    }

    install_dependencies()
    {

    }

    obtain_repository()
    {

    }

    setup()
    {

    }

    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        setup
    fi
    ```

- configure.sh
    ```bash
    
    ```

- compile.sh
    ```console
    setup()
    {

    }

    build()
    {

    }

    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        setup
        build
    fi
    ```

- installer.sh
    ```console
    setup()
    {

    }

    begin_install()
    {

    }

    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        setup
        begin_install
    fi
    ```

- cleanup.sh
    ```console
    setup()
    {

    }

    clean()
    {

    }

    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        clean
    fi
    ```

- start.sh
    ```console
    # Current script variable
    SCRIPTS=() # List all scripts you wish to execute

    main()
    {
`
    }

    if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
        main "$@"
    fi
    ```

### Others
```
WIP
```

## Wiki
### Terminologies
- BASH_SOURCE : in the template skeleton, you may realise that the templates (or most of my shellscripts in general) contains the following line
        ```console
        if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
            main "$@"
        fi
        ```
    * This is the equivalent to python's 
        ```python
        if __name__ == "__main__":
            main()
        ```
    - In that, this checks that the running script if the script itself
        + the code (in this case - main) will not be executed unless it is executed itself, and
        + the function will not be executed if it was sourced and/or called as a library/module.

### References
- Template Source Code
    - Please refer to the following folders for source code templates for the various styles
        + [Shellscript (current default)](docs/contributions/templates/python) for shellscript example
        + [Python (under development)](docs/contributions/templates/python) for python example

