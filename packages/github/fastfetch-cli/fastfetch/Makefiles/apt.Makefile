# Makefile
# for Building from Source projects from GitHub
## - Please change the specifications, targets/recipe/functions and variables according to specification by developer

## Variables/Ingredients
### Build Info
CC = cmake
CFLAGS = 
DEPENDENCIES = python3 git build-essential cc make gcc curl pkg-config g++ ninja cmake

### Package Information
PKG_AUTHOR = fastfetch-cli
PKG_NAME = fastfetch
BIN_NAME = fastfetch flashfetch
SRC_URL = https://github.com/$(PKG_AUTHOR)/$(PKG_NAME)
INSTALL_PATH = /usr/local
CONFIGURE_OPTS = --prefix $(INSTALL_PATH)

SHELL := /bin/bash
.PHONY := help install-dependencies clone configure setup build build-all build-doc install install-bin install-html install-doc uninstall clean enter
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
	@echo -e "[+] uninstall : Uninstall and remove the installed files from the host system"
	@echo -e "[+] clean : Clean/Remove all temporarily-generated files from repository"
	@echo -e "[+] enter : Enter the package repository"

install-dependencies:
	## Install dependencies
	@apt update && apt upgrade && apt install ${DEPENDENCIES}

clone:
	### Clone repository if doesnt exist and initialize submodules
	@test -d ${PKG_NAME} || git clone "${SRC_URL}"

configure: clone
	## Configure the repository source files before building
	@cd ${PKG_NAME}; mkdir -pv build && cd build && cmake ..

setup: clone configure
	## Setup and perform pre-requisites

build: build-all
	## Compile/Build everything

build-all: setup
    ## Compile and Build/make the source code into an executable 
	@cd ${PKG_NAME}/build; ${CC} ${CFLAGS} --build . --target fastfetch --target flashfetch && \
		echo -e "[+] Compilation Successful." || \
		echo -e "[-] Compilation Error."

install: install-bin
	## Install everything to the host system

install-bin: clone
    ## Install and move the compiled binary to the host system
	@cd ${PKG_NAME}/build; ${CC} ${CFLAGS} --install . --prefix ${INSTALL_PATH} && \
        echo -e "[+] Executable Installation Successful." || \
        echo -e "[-] Executable Installation Error."

uninstall:
    ## Uninstall and remove installed files from the host system
	### Place your uninstallation/removal steps here
	@echo -e "Uninstalling '${INSTALL_PATH}/bin/fastfetch'" && rm -r ${INSTALL_PATH}/bin/fastfetch
	@echo -e "Uninstalling '${INSTALL_PATH}/bin/flashfetch'" && rm -r ${INSTALL_PATH}/bin/flashfetch
	@echo -e "Uninstalling '${INSTALL_PATH}/share/bash-completion/completions/fastfetch'" && rm -r ${INSTALL_PATH}/share/bash-completion/completions/fastfetch
	@echo -e "Uninstalling '${INSTALL_PATH}/share/fish/vendor_completions.d/fastfetch.fish'" && rm -r ${INSTALL_PATH}/share/fish/vendor_completions.d/fastfetch.fish
	@echo -e "Uninstalling '${INSTALL_PATH}/share/fastfetch/'" && rm -r ${INSTALL_PATH}/share/fastfetch/
	@echo -e "Uninstalling '${INSTALL_PATH}/share/licenses/fastfetch/LICENSE'" && rm -r ${INSTALL_PATH}/share/licenses/fastfetch
	@echo -e "Uninstalling '${INSTALL_PATH}/share/man/man1/fastfetch.1'" && rm -r ${INSTALL_PATH}/share/man/man1/fastfetch.1

clean: clone
	## Cleanup and remove temporary files generated during compilation
	@cd ${PKG_NAME} && rm -r build && mkdir -pv build && \
        echo -e "[+] Cleanup Successful." || \
        echo -e "[-] Cleanup Error."

enter: clone
	## Enter the package repository
	@cd ${PKG_NAME};

