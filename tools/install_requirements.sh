#!/bin/bash

# INSTALL REQUIREMENTS

# Admin request
[ "$EUID" -ne 0 ] && exec sudo "$0" "$@"

# Change the current working directory to the root directory
cd "$(dirname "$0")"
cd ..

# Python venv path
python="$(pwd)/venv/bin/python"

# Install pip
sudo apt install -y wget
wget https://bootstrap.pypa.io/get-pip.py
sudo $python get-pip.py
sudo rm -rf get-pip.py

# Install libraries listed in requirements.txt
$python -m pip install -U -r requirements.txt

# Check python version
$python --version

# List installed libraries
$python -m pip list

echo
echo "All requirements installed"
echo
read -p "Press Enter to continue..."
