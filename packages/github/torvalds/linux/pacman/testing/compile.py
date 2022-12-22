#!/bin/env python3
"""
Manually Compiling the Linux Kernel from source code

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
    "base-devel",
    "ncurses",
    "xz",
    "bc",
    "bison",
    "flex",
    "openssl",
    "libelf",
]

# Package Information
PKG_AUTHOR="torvalds"
PKG_NAME="linux"
SRC_URL="https://github.com/{}/{}".format(PKG_AUTHOR, PKG_NAME)

# Utilities
def exec_test(cmd, process_flags={"stdin":subprocess.PIPE, "stdout":subprocess.PIPE}):
    """
    Execute shell commands and 
    return the result and result code]

    :: Params
    - cmd : The command and flags to execute
        Type: List
        Format:
            [
                "command",
                "flags", 
                ...
            ]

    - process_flags : The subprocess Popen flags to execute with the command
        Type: Dictionary
        Default:
            {
                "stdin" : subprocess.PIPE,
                "stdout" : subprocess.PIPE
            }
    """
    res = [] # To store all standard output
    rc = 0 # To store return code
    args = "" # To store arguments
    ps = None
    with Popen(cmd, **process_flags) as proc:
        # Open process to execute command
        # while process is still ongoing

        # Get all standard output
        for line in proc.stdout:
            res.append(line.rstrip())

        # Communicate and wait for program to complete before proceeding
        ps = proc.communicate()[0]

        # Get return code
        # after finished/usage
        rc = proc.returncode
        args = proc.args

    if rc != 0:
        # 0 = Success
        # >= 0 = Error
        raise CalledProcessError(rc, args)

    ret_value = {
        "Command Executed" : "{}".format(' '.join(cmd)),
        "Return Code" : "{}".format(rc),
        "Arguments" : "{}".format(args),
        "Results" : "{}".format(res)
    }
    return ret_value

def exec_series(cmd, process_flags={"stdin":subprocess.PIPE, "stdout": subprocess.PIPE}):
    """
    Execute shell commands back to back in a series and 
    return the result and result code]

    :: Params
    - cmd : The command and flags to execute
        Type: List
        Format:
            [
                "command",
                "flags", 
                ...
            ]

    - process_flags : The subprocess Popen flags to execute with the command
        Type: Dictionary
        Default:
            {
                "stdin" : subprocess.PIPE,
                "stdout" : subprocess.PIPE
            }
    """
    # process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    process = subprocess.Popen(cmd, **process_flags)
    result = process.communicate()[0]
    rc = process.returncode

    result_values = {
        "process" : process,
        "data" : result,
        "result-code" : rc
    }
    return result_values

def exec_parallel(cmd, process_flags={"stdin":subprocess.PIPE, "stdout": subprocess.PIPE}):
    """
    Execute shell commands asynchronously/multiprocessing and 
    return the result and result code]

    :: Params
    - cmd : The command and flags to execute
        Type: List
        Format:
            [
                "command",
                "flags", 
                ...
            ]

    - process_flags : The subprocess Popen flags to execute with the command
        Type: Dictionary
        Default:
            {
                "stdin" : subprocess.PIPE,
                "stdout" : subprocess.PIPE
            }
    """
    # process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    process = subprocess.run(cmd, **process_flags)
    result = process.stdout
    rc = process.returncode

    result_values = {
        "process" : process,
        "data" : result,
        "result-code" : rc
    }
    return result_values

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
    cmd = ["pacman", "-S", *DEPENDENCIES]
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

    # X-windows (Qt) based configuration tool, works best under KDE Desktop
    # ${CC} xconfig

    # X-windows (GTK) based configuration tool, works best under GNOME Desktop
    # ${CC} gconfig

    # Get return code
    rc = process.returncode
    return rc

def build():
    """
    Compile and Build/make the linux kernel
    """
    cmd = [CC, *CFLAGS.split(" ")]
    error_list = [
        # "Error Message"
    ]
    build_codes = {
        "AR" : "Archive",
        "AS" : "Assemble",
        "CC" : "Cross Compile",
        "LD" : "Link Directory",
        "GEN" : "Generate",
        "MKCAP" : "",
        "OBJCOPY" : "Copy Object",
        "[M]" : "Module"
    }
    print(cmd)
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    """
    while True:
        # Poll will check if child process has been terminated
        if process.poll() is not None:
            break
        else:
            output = process.stdout.readline()
            print("Current Output : {}".format(output.strip().decode("utf-8")))

            ret = output.strip().decode("utf-8")

            # Validation check if return string is error
            if "error" in ret:
                # If is error, quit the script
                error_list.append(ret)
                print("Error found:")

                # Add error to an error list
                for i in range(len(error_list)):
                    # Print errors
                    error = error_list[i]
                    print("{} : {}".format(i, error))

                # Kill the process
                process.kill()
                break
    """
    line_number = 0
    """
    is_alive = process.poll()
    while is_alive == None:
        print(is_alive)
        # Check if process is alive
        is_alive = process.poll()
    """
    for ln in process.stdout:
        # Output
        line_number += 1
        output = ln.strip().decode("utf-8")
        print("{} : {}".format(line_number, output))

    # poll will check if child process has been terminated
    rc = process.poll() 
    print("Return Code : {}".format(rc))

    """
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    result = process.communicate()[0]
    while True:
        # Read standard output 1 by 1
        output = process.stdout.readline()
        if output == "" and process.poll() is not None:
            break
        else:
            print()
    rc = process.returncode
    """

    """
    result = exec_test(cmd)
    rc = result["Return Code"]
    """
    return rc

def install_kernel_modules():
    """
    Install the Linux Kernel Modules
    """
    cmd = [CC, CFLAGS, "modules_install"]
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    result = process.communicate()[0] # Interacts with the process; sends data into stdin, Read data from stdout and stderr until End-of-File. Flushes the data from stdout and stderr and Waits for process to terminate
    data = result.strip().decode("utf-8")
    rc = process.returncode
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
    print("[+] Configure your kernel")
    rc = configure()
    if(rc == 0):
        print("[+] Configuration completed.")
        input("Paused")
    else:
        print("[-] Error configuring.")
        exit()

    print("")

    print("[+] Starting Kernel Compilation")
    rc = build()
    if(rc == 0):
        print("[+] Kernel Compilation Successful.")
        input("Paused.")
    else:
        print("[-] Kernel Compilation Error.")
        exit()

    print("")

    print("[+] Starting kernel module installation...")
    rc = install_kernel_modules()
    if(rc == 0):
        print("[+] Modules Installation Successful.")
        input("Paused")
    else:
        print("[-] Modules Installation Error.")
        exit()

    print("")

    print("[+] Starting kernel installation...")
    rc = install()
    if(rc == 0):
        print("[+] Kernel Installation Successful.")
    else:
        print("[-] Kernel Installation Error.")
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
