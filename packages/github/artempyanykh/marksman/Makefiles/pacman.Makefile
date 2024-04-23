# Makefile
# for Building from Source

## Variables/Ingredients
### Build Info
CC = make
CFLAGS = 
DEPENDENCIES ?= git dotnet-sdk-8.0

### Package Information
PKG_AUTHOR = artempyanykh
PKG_NAME = marksman
BIN_NAME = marksman
SRC_URL = https://github.com/$(PKG_AUTHOR)/$(PKG_NAME)

SHELL := /bin/bash
.PHONY := help install-dependencies setup build install uninstall clean enter
.DEFAULT_RULES := help

## Recipe/Targets
help:
	## Display help message
	@echo -e "[+] help  : Display Help message"
	@echo -e "[+] install-dependencies : Install system packages"
	@echo -e "[+] setup : Setup pre-requisites"
	@echo -e "[+] build : Build the project from Source"
	@echo -e "[+] install : Install and move the compiled binary to the host system"
	@echo -e "[+] uninstall : Uninstall and remove the installed files from the host system"
	@echo -e "[+] clean : Clean/Remove all temporarily-generated files from repository"
	@echo -e "[+] enter : Enter the package repository"

install-dependencies:
	## Install dependencies
	@pacman -Syu && pacman -S ${DEPENDENCIES}

setup:
	### Clone repository if doesnt exist
	@test -d ${PKG_NAME} || git clone "${SRC_URL}"

build: setup
    ## Compile and Build/make the source code into an executable 
	@cd ${PKG_NAME}; ${CC} ${CFLAGS} && \
		echo -e "[+] Compilation Successful." || \
		echo -e "[-] Compilation Error."

install: setup
    ## Install and move the compiled binary to the host system
	@cd ${PKG_NAME}; ${CC} install && \
        echo -e "[+] Installation Successful." || \
        echo -e "[-] Installation Error."

uninstall: setup
    ## Uninstall and remove installed files from the host system
	@cd ${PKG_NAME}; ${CC} uninstall && \
        echo -e "[+] Installation Successful." || \
        echo -e "[-] Installation Error."

clean: setup
	## Cleanup and remove temporary files generated during compilation
	@cd ${PKG_NAME}; ${CC} clean && \
        echo -e "[+] Cleanup Successful." || \
        echo -e "[-] Cleanup Error."

enter:
	## Enter the package repository
	@cd ${PKG_NAME};

