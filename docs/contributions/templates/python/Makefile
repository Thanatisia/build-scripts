# Makefile
# for 
# automating
# manual building/compilation using make

# === Compilation Variables ===
# Compilers
CC = "python3" # Cross Compiler
CFLAGS = "-B" # Cross Compiler Flags
DEP = (python3) # Dependencies
ENV = "" # Environment Variables

# File Names
CFILE = "compile.py" # Compiler file
LOGFILE = "debug.log"

# Repositories
REPO_AUTHOR = "AUTHOR_NAME"
REPO_NAME = "PROJECT_NAME"
REPO_FLDR = "FOLDER_NAME"

# === Rules/Targets ===
.PHONY := help setup clone prepare backup build conf install install_log clean
.DEFAULT_RULES := help

# Compile script functions
help:
	## Display all targets/instructions
	@echo "=== General Instructions ==="
	@echo "setup       : Prepare dependencies and setup system for compilation"
	@echo "clone       : Clone repository"
	@echo "prepare     : Install pre-requisites and dependencies"
	@echo "backup      : Backup system files"
	@echo "build       : Compile repository only"
	@echo "conf        : Configure repository"
	@echo "install     : Run full compiler/installer"
	@echo "install_log : Run install rule but with logging to log file"
	@echo "clean       : Cleanup repository with temporary files"
	@echo ""
	@echo "=== Repository-specific instructions ==="


setup:
	## Prepare dependencies and setup
	@echo "Setting up..."
	@${CC} ${CFLAGS} -c "from compile import setup; setup()" && \
		echo "[+] System prepared." || \
		echo "[-] Error preparing system."

clone:
	## Clone repository
	@echo "Cloning repository..."
	@${CC} ${CFLAGS} -c "from compile import clone_repo; clone_repo()" && \
		echo "[+] Repository cloned successfully." || \
		echo "[-] Error cloning repository."

prepare:
	## Install pre-requisites and dependencies
	@echo "Cloning repository..."
	@sudo ${CC} ${CFLAGS} -c "from compile import install_dependencies; install_dependencies()" && \
		echo "[+] Dependencies installed." || \
		echo "[-] Error installing dependencies."

backup:
	## Backup system files
	@echo "Backing up..."
	@sudo ${CC} ${CFLAGS} -c "from compile import setup, backup; setup(); backup()" && \
		echo "[+] System backed up." || \
		echo "[-] Error backing up."

build:
	## Compile Linux Kernel only
	@echo "Compiling..."
	@${CC} ${CFLAGS} -c "from compile import setup, build; setup(); build()" && \
		echo "[+] Linux Kernel compiled successfully." || \
		echo "[-] Linux Kernel compilation error."

conf:
	## Configure Linux Kernel
	@echo "Configuring..."
	@${CC} ${CFLAGS} -c "from compile import setup, configure; setup(); configure()" && \
		echo "[+] Configuration completed." || \
		echo "[-] Error configuirng..."

install:
	## Run full compiler/installer
	@./${CFILE}

install_log:
	## Run full compiler/installer with logging
	@./${CFILE} | tee ${LOGFILE}

clean:
	## Clean up source file of temporary/built files
	@echo "Cleaning up..."
	@${CC} ${CFLAGS} -c "from compile import clean; clean()" && \
		echo "[+] Repository cleaned successfully." || \
		echo "[-] Repository cleaning error."

# Repository instructions

