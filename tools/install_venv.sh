#!/bin/bash

# INSTALL VIRTUAL ENVIRONMENT

# Admin request
[ "$EUID" -ne 0 ] && exec sudo "$0" "$@"

# Change the current working directory to the root directory
cd "$(dirname "$0")"
cd ..

# Python version
version=$(cat python_version.txt | awk -F. '{print $1"."$2}')

# Check python version
python$version --version

# Create Python venv
sudo apt install -y python$version-venv
sudo mkdir venv
python$version -m venv venv
source "$(pwd)/venv/bin/activate"

# Set all permissions
sudo chmod -R 777 venv

# New Python venv path
python="$(pwd)/venv/bin/python"

# Check python version
$python --version

echo
echo "Python virtual environment installed"
echo
read -p "Press Enter to continue..."
