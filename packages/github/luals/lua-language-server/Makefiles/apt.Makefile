# Makefile
# for Building from Source projects from GitHub
## - Please change the specifications, targets/recipe/functions and variables according to specification by developer

## Variables/Ingredients
### Build Info
CC = 
CFLAGS = 
DEPENDENCIES = python3 git build-essential make gcc g++ curl ninja-build

### Package Information
PKG_AUTHOR = LuaLS
PKG_NAME = lua-language-server
BIN_NAME = lua-language-server
SRC_URL = https://github.com/$(PKG_AUTHOR)/$(PKG_NAME)
INSTALL_PATH = $(HOME)/.local
CONFIGURE_OPTS = 
PLATFORM = linux

### Git options
REPO_DIR = $(INSTALL_PATH)/bin/$(PKG_NAME)
CLONE_OPTS = 

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
	@echo -e "[+] build : Build the project from Source"
	@echo -e "[+] install: Default/Recommended installation action"
	@echo -e "[+] uninstall : Uninstall and remove the installed files from the host system"
	@echo -e "[+] clean : Clean/Remove all temporarily-generated files from repository"
	@echo -e "[+] enter : Enter the package repository"

install-dependencies:
	## Install dependencies
	@apt update && apt upgrade && apt install ${DEPENDENCIES}

clone:
	### Clone repository if doesnt exist and initialize submodules
	@test -d ${REPO_DIR} || git clone ${CLONE_OPTS} "${SRC_URL}" ${REPO_DIR}

configure: clone
	## Configure the repository source files before building
	@cd ${REPO_DIR}; git submodule update --recursive && \
		cd 3rd/luamake && \
		git submodule update --init --recursive

setup: clone configure
	## Setup and perform pre-requisites

build: setup
	## Compile and Build/make the source code into an executable 
	@cd ${REPO_DIR}; cd 3rd/luamake && ninja -f compile/ninja/${PLATFORM}.ninja && \
		cd ../../; ./3rd/luamake/luamake rebuild && \
			echo -e "[+] Compilation Successful." || \
			echo -e "[-] Compilation Error."

install:
	## Default/Recommended installation action
	## Check if the system PATH environment variable contains the variable 'REPO_DIR/bin' using 'findstring <your-target-string>, <your-variable>'
	@if [[ "$(PATH)" =~ "${REPO_DIR}/bin" ]]; then \
		echo -e "String is found in PATH, do not append"; \
	else \
		echo -e "export PATH+=:${REPO_DIR}/bin:" >> $(HOME)/.bashrc && \
			echo -e "[+] LSP server and Code plugin Installed Successfully." || \
			echo -e "[-] LSP server and Code plugin Installation Error."; \
	fi

uninstall:
    ## Uninstall and remove installed files from the host system
	### Place your uninstallation/removal steps here
	@rm -r ${REPO_DIR} && \
        echo -e "[+] LSP Server Uninstallation Successful." || \
        echo -e "[-] LSP Server Uninstallation Error."

clean: clone
	## Cleanup and remove temporary files generated during compilation
	@cd ${REPO_DIR}; rm -r build && \
        echo -e "[+] Cleanup Successful." || \
        echo -e "[-] Cleanup Error."

enter: clone
	## Enter the package repository
	@cd ${REPO_DIR};

