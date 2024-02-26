# Makefile for building from source

## Ingredients/Instructions/Variables
### Compiler
CC = cl
CFLAGS = 

### Package
DEPENDENCIES = wget tar unzip

### Source
SRC = sqlite3.c shell.c
HEADERS = sqlite3.h
OUT = sqlite3.exe

### Environment Variables
SQLITE_SRC_YEAR := 2024
SQLITE_SRC_VERSION := 3450100
SQLITE_AUTOCONF_TARBALL := sqlite-autoconf
SQLITE_AMALGAMATION_ZIP := sqlite-amalgamation

## Rules/Targets
.PHONY := help setup sqlite sqlite-dll
.DEFAULT_RULES := help

help:
	## Display help message
	@echo "setup-autoconf : Download and prepare pre-requisites for the autoconf source code"
	@echo "setup-amalgamation : Download and prepare pre-requisites for the amalgamation source code"
	@echo "sqlite : Build SQLite3 executable"
	@echo "sqlite-dll : Build SQLite3 Dynamic Link Libraries (DLL)"
	@echo "libsqlite : Build SQLite3 Libraries"
	@echo "install-libsqlite : Install the built SQLite3 libraries to system library directory"
	@echo "uninstall-libsqlite : Uninstall and remove the installed SQLite3 libraries from system library directory"

### Setup

setup-autoconf:
	## Download SQLite3 autoconf C source code
	@test -d ${SQLITE_AUTOCONF_TARBALL}-${SQLITE_SRC_VERSION} \
		|| wget https://www.sqlite.org/${SQLITE_SRC_YEAR}/${SQLITE_AUTOCONF_TARBALL}-${SQLITE_SRC_VERSION}.tar.gz \
		&& tar -xvzf ${SQLITE_AUTOCONF_TARBALL}-${SQLITE_SRC_VERSION}.tar.gz ## Extract tarball

setup-amalgamation:
	## Download SQLite3 amalgamation C source code
	@test -d ${SQLITE_AMALGAMATION_ZIP}-${SQLITE_SRC_VERSION} \
		|| wget https://www.sqlite.org/${SQLITE_SRC_YEAR}/${SQLITE_AMALGAMATION_ZIP}-${SQLITE_SRC_VERSION}.zip \
		&& unzip ${SQLITE_AMALGAMATION_ZIP}-${SQLITE_SRC_VERSION}.zip ## Extract zip archive


### Building 

sqlite: setup-amalgamation
	@cd ${SQLITE_AMALGAMATION_ZIP}-${SQLITE_SRC_VERSION} \
		&& ${CC} ${CFLAGS} ${SRC} -Fe${OUT} ## Build SQLite3 executable

sqlite-dll: setup-amalgamation
	## Change directory into archive
	@cd ${SQLITE_AMALGAMATION_ZIP}-${SQLITE_SRC_VERSION} \
		&& ${CC} ${CFLAGS} -link -dll -out:sqlite3.dll ## Build Windows DLL of SQLite 

libsqlite: setup-autoconf
	## Change directory into tarball
	@cd ${SQLITE_AUTOCONF_TARBALL}-${SQLITE_SRC_VERSION} && \ 
		## Build SQLite3 Source Code and libraries
		test -d build || mkdir -pv build && \
			./configure; make

### Installation

install-libsqlite:
	## Change directory into tarball
	@cd ${SQLITE_AUTOCONF_TARBALL}-${SQLITE_SRC_VERSION} && make install

uninstall-libsqlite:
	## Change directory into tarball
	@cd ${SQLITE_AUTOCONF_TARBALL}-${SQLITE_SRC_VERSION} && make uninstall


