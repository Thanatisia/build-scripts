# Makefile
# for Building from Source projects from GitHub
## - Please change the specifications, targets/recipe/functions and variables according to specification by developer

## Variables/Ingredients
### Build Info
CC = cargo
CFLAGS = 
DEPENDENCIES = python3 git build-essential cc make gcc curl cargo rustc npm nodejs

### Package Information
PKG_AUTHOR = sharkdp
PKG_NAME = bat
BIN_NAME = bat
SRC_URL = https://github.com/$(PKG_AUTHOR)/$(PKG_NAME)
INSTALL_PATH=/usr/local
CONFIGURE_OPTS = 

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
	@echo -e "[+] install: Default/Recommended installation action (install-lsp-server)"
	@echo -e "[+] install-rustup : Install package using rustup"
	@echo -e "[+] install-all : Install the LSP server and the VS Code plugin"
	@echo -e "[+] install-lsp-server : Install only the LSP server to the host system"
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
	@cd ${PKG_NAME}; ${CC} ${CONFIGURE_OPTS}

setup: clone
	## Setup and perform pre-requisites

build: setup
	## Compile and Build/make the source code into an executable 
	@cd ${PKG_NAME}; ${CC} install --locked ${PKG_NAME} && \
		echo -e "[+] Compilation Successful." || \
		echo -e "[-] Compilation Error."

install: install-lsp-server
	## Default/Recommended installation action

install-all: clone
    ## Install the LSP server and the VS Code plugin
	@cd ${PKG_NAME}; ${CC} install ${PKG_NAME} && \
        echo -e "[+] LSP server and Code plugin Installed Successfully." || \
        echo -e "[-] LSP server and Code plugin Installation Error."

install-lsp-server: clone
    ## Install only the LSP server to the host system
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} xtask install --server && \
        echo -e "[+] LSP Server Installation Successful." || \
        echo -e "[-] LSP Server Installation Error."

uninstall: clone
    ## Uninstall and remove installed files from the host system
	### Place your uninstallation/removal steps here
	@cargo uninstall ${PKG_NAME} && \
        echo -e "[+] LSP Server Uninstallation Successful." || \
        echo -e "[-] LSP Server Uninstallation Error."

clean: clone
	## Cleanup and remove temporary files generated during compilation
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} clean && \
        echo -e "[+] Cleanup Successful." || \
        echo -e "[-] Cleanup Error."

enter: clone
	## Enter the package repository
	@cd ${PKG_NAME};

