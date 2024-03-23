# Makefile
# for Building from Source

### Build Info
CC = make
CFLAGS = 
DEPENDENCIES = build-essential make autoconf gettext gcc g++ asciidoc libcurl4-openssl-dev libexpat1-dev

### Package Information
PKG_AUTHOR = git
PKG_NAME = git
BIN_NAME = git
SRC_URL = https://github.com/$(PKG_AUTHOR)/$(PKG_NAME)
INSTALL_PATH=/usr/local
CONFIGURE_OPTS="--prefix=$(INSTALL_PATH)"

EDITOR=vim
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
	@apt update && apt upgrade && apt install ${DEPENDENCIES}

clone:
	### Clone repository if doesnt exist and initialize submodules
	@test -d ${PKG_NAME} || git clone "${SRC_URL}" && cd ${PKG_NAME}; \
		# Initialize git submodule contents
		## 2>&1 : Redirect stderr to stdout
		echo -e "Initializing git submodules..."; git submodule init 2>&1; \
		# Update and clone all git submodules recursively
		echo -e "Cloning all git submodules..."; git submodule update --recursive 2>&1

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
	@rm /usr/local/bin/{git,gitk,git-shell,git-upload-pack,git-cvsserver,git-receive-pack,git-upload-archive,scalar}
	@test -d /usr/local/libexec/git-core/ && rm -r /usr/local/libexec/git-core/
	@test -d /usr/local/share/gitweb/ && rm -r /usr/local/share/gitweb/
	@test -d /usr/local/share/git-core/ && rm -r /usr/local/share/git-core/
	@test -d /usr/local/share/git-gui/ && rm -r /usr/local/share/git-gui/
	@test -d /usr/local/share/gitk/ && rm -r /usr/local/share/gitk/
	@test -d /usr/local/share/gitweb/ && rm -r /usr/local/share/gitweb
	@test -d /usr/local/share/doc/git/ && rm -r /usr/local/share/doc/git/
	@test -d /usr/local/share/doc/git-doc/ && rm -r /usr/local/share/doc/git-doc/
	@rm /usr/local/share/man/man1/git*
	@rm /usr/local/share/man/man1/scalar.1
	@rm /usr/local/share/man/man3/Git.3pm
	@rm /usr/local/share/man/man5/git*
	@rm /usr/local/share/man/man7/git*

clean: clone
	## Cleanup and remove temporary files generated during compilation
	@cd ${PKG_NAME}; ${CC} clean && \
        echo -e "[+] Cleanup Successful." || \
        echo -e "[-] Cleanup Error."

enter: clone
	## Enter the package repository
	@cd ${PKG_NAME};

