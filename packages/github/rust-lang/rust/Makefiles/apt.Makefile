# Makefile
# for Building from Source projects from GitHub
## - Please change the specifications, targets/recipe/functions and variables according to specification by developer

## Variables/Ingredients
### Build Info
CC = ./x.py
CFLAGS = 
DEPENDENCIES = python3 git build-essential cc make gcc curl pkg-config libiconv libssl-dev g++ ninja cmake libstdc++-static

### Package Information
PKG_AUTHOR = rust-lang
PKG_NAME = rust
BIN_NAME = "rustup" "rustc" "rustdoc" "cargo"
SRC_URL = https://github.com/$(PKG_AUTHOR)/$(PKG_NAME)
INSTALL_PATH=/usr/local
CONFIGURE_OPTS = --set install.prefix=$(INSTALL_PATH)

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
	@cd ${PKG_NAME}; ./configure ${CONFIGURE_OPTS}

setup: clone configure
	## Setup and perform pre-requisites

build: build-all build-doc
	## Compile/Build everything

build-all: setup
    ## Compile and Build/make the source code into an executable 
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} build && \
		echo -e "[+] Compilation Successful." || \
		echo -e "[-] Compilation Error."

build-doc: setup
	## Compile and Build documentations
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} doc && \
		echo -e "[+] Compilation Successful." || \
		echo -e "[-] Compilation Error."

install: install-bin
	## Install everything to the host system

install-bin: clone
    ## Install and move the compiled binary to the host system
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} install && \
        echo -e "[+] Executable Installation Successful." || \
        echo -e "[-] Executable Installation Error."

uninstall: clone
    ## Uninstall and remove installed files from the host system
	### Place your uninstallation/removal steps here
	@rm -r ${INSTALL_PATH}/bin/rustc; \
	 rm -r ${INSTALL_PATH}/bin/rustdoc; \
	 rm -r ${INSTALL_PATH}/bin/cargo

clean: clone
	## Cleanup and remove temporary files generated during compilation
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} clean && \
        echo -e "[+] Cleanup Successful." || \
        echo -e "[-] Cleanup Error."

enter: clone
	## Enter the package repository
	@cd ${PKG_NAME};

