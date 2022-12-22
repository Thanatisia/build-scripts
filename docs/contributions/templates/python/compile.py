#!/bin/env python3
"""
Manually Compiling from source code

Method: Compile from Scratch to ensure that it is on the latest version

Target Base System: Debian
Target Package Manager: apt
"""
import os
import sys

# System command calling
import subprocess
from subprocess import Popen, CalledProcessError

# Build Info
CC="make"
CFLAGS="-j4" # Use 4 cores/threads
DEPENDENCIES=[
    "git",
    "wget", 
    "build-essential",
]

# Package Information
PKG_AUTHOR="AUTHORS-NAME-HERE"
PKG_NAME="REPOSITORY_NAME_HERE"
SRC_URL="https://github.com/{}/{}".format(PKG_AUTHOR, PKG_NAME)

# Utilities

# functions
def backup():
    """
    backup all important files
    """
    print("[+] backing up kernel boot config files...")

    # Get kernel version number
    cmd = ["uname", "-r"]
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    kernel_version = process.communicate()[0].decode("utf-8").rstrip("\n")
    print("Kernel Version : {}".format(kernel_version))

    boot_cfg = "/boot/config-{}".format(kernel_version)
    cmd = ["cp", "-v", boot_cfg, ".config"]
    subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)

def clone_repo():
    """
    Clone Repositories
    """
    # Clone git repository
    cmd = ["git", "clone", "--depth", "1", SRC_URL]
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE).communicate()

def install_dependencies():
    """
    Install pre-requisites and dependencies
    """
    # Install dependencies
    cmd = ["apt", "install", "-y", *DEPENDENCIES]
    # process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE).communicate()
    rc = subprocess.run(cmd, stdout=subprocess.PIPE)

def setup():
    """
    Setup all dependencies required to build
    """
    # Backup important files
    backup()

    # Clone repository
    clone_repo()

    # Install dependencies
    install_dependencies()

    # Change directory into source code
    os.chdir(PKG_NAME)


def configure():
    """
    Configure the kernel source code configurations
    - Make your choices
    """

    # TUI (Terminal User Interface) color menus, radiolists, dialogs. Useful for remote server (SSH) kernel compilations.
    cmd = [CC, "menuconfig"]
    print(cmd)
    process = subprocess.run(cmd)

    # Get return code
    rc = process.returncode
    return rc

def build():
    """
    Compile and Build/make the linux kernel
    """
    # Variables
    cmd = [CC, *CFLAGS.split(" ")]
    error_list = [
        # "Error Message"
    ]
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    line_number = 0

    # Processing
    for ln in process.stdout:
        # Output
        line_number += 1
        output = ln.strip().decode("utf-8")
        print("{} : {}".format(line_number, output))

    # poll will check if child process has been terminated
    rc = process.poll() 
    print("Return Code : {}".format(rc))

    # Return the return code
    return rc

def install():
    """
    Install the Linux Kernel
    """
    cmd = [CC, "install"]
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    result = process.communicate()[0]
    data = result.strip().decode("utf-8")
    rc = process.returncode
    return rc

def clean():
    """
    Cleanup and remove temporary files generated during compilation
    """
    cmd = [CC, "clean"]
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    result = process.communicate()[0]
    data = result.strip().decode("utf-8")
    rc = process.returncode
    return rc


def main():
    print("[+] Configure")
    rc = configure()
    if(rc == 0):
        print("[+] Configuration completed.")
        input("Paused")
    else:
        print("[-] Error configuring.")
        exit()

    print("")

    print("[+] Starting Compilation")
    rc = build()
    if(rc == 0):
        print("[+] Compilation Successful.")
        input("Paused.")
    else:
        print("[-] Compilation Error.")
        exit()

    print("")

    print("[+] Starting installation...")
    rc = install()
    if(rc == 0):
        print("[+] Installation Successful.")
    else:
        print("[-] Installation Error.")
        exit()

    print("")

    """ Cleanup process, uncomment this if you wish to cleanup the compilation automatically after installation
    rc = clean()
    if(rc == 0):
        print("[+] Cleanup Successful.")
    else:
        print("[-] Cleanup Error.")
    """

    # Completed
    print("[O] Installation completed.")

if __name__ == "__main__":
    setup()
    main()
