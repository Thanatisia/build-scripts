#!/bin/env bash
: "
Download the template source files required for the repository
"

# Project Variables
TARGET_PACKAGE_AUTHOR="billw2" # Your target project's author
TARGET_PACKAGE_NAME="rpi-clone" # Your target project name
PKG_MGR="apt" # Your package manager
SOURCE_FILES=("installer.sh" "settings.sh" "setup.sh" "start.sh" "uninstaller.sh")
TARGET_PACKAGE_SRC_BASE_URL="https://raw.githubusercontent.com/Thanatisia/build-scripts/main/packages/github/$TARGET_PACKAGE_AUTHOR/$TARGET_PACKAGE_SRC_URL/$PKG_MGR/"

# Download files
for src in "${SOURCE_FILES[@]}"; do
    curl -L -O $TARGET_PACKAGE_SRC_BASE_URL/$src && \
        echo -e "$src has been downloaded." || \
        echo -e "$src download error."
done


