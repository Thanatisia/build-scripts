# Makefile
# for Building from Source projects from GitHub
## - Please change the specifications, targets/recipe/functions and variables according to specification by developer

## Variables/Ingredients
### Build Info
CC = make
CFLAGS = 
DEPENDENCIES = python3 git build-essential make curl glibc coreutils libxext libxrandr fontconfig

### Package Information
PKG_AUTHOR = suckless
PKG_NAME = slock
BIN_NAME = $(PKG_NAME)
SRC_DOMAIN = "https://git.suckless.org"
SRC_URL = $(SRC_DOMAIN)/$(PKG_NAME)
INSTALL_PATH = $(PREFIX)
CONFIGURE_OPTS = --prefix $(INSTALL_PATH)

EDITOR ?= vim
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
	@pkg update && pkg upgrade && pkg add ${DEPENDENCIES}

clone:
	### Clone repository if doesnt exist and initialize submodules
	@test -d ${PKG_NAME} || git clone "${SRC_URL}"

configure: clone
	## Configure the repository source files before building
	@cd ${PKG_NAME}; ${EDITOR} config.def.h config.mk

setup: clone
	## Setup and perform pre-requisites

build: build-all
	## Compile/Build everything

build-all: setup
    ## Compile and Build/make the source code into an executable 
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} && \
		echo -e "[+] Compilation Successful." || \
		echo -e "[-] Compilation Error."

install: install-bin
	## Install everything to the host system

install-bin: clone
    ## Install and move the compiled binary to the host system
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} install && \
        echo -e "[+] Executable Installation Successful." || \
        echo -e "[-] Executable Installation Error."

uninstall:
    ## Uninstall and remove installed files from the host system
	### Place your uninstallation/removal steps here
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} uninstall && \
        echo -e "[+] Uninstallation Successful." || \
        echo -e "[-] Uninstallation Error."

clean: clone
	## Cleanup and remove temporary files generated during compilation
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} clean && \
        echo -e "[+] Cleanup Successful." || \
        echo -e "[-] Cleanup Error."

enter: clone
	## Enter the package repository
	@cd ${PKG_NAME};

