#!/bin/bash

# INSTALL PYTHON

# Admin request
[ "$EUID" -ne 0 ] && exec sudo "$0" "$@"

# Change the current working directory to the root directory
cd "$(dirname "$0")"
cd ..

# Python version
version=$(cat python_version.txt | awk -F. '{print $1"."$2}')

# Upgrade system
sudo apt update -y

# The “deadsnakes” team maintains Launchpad PPA and consistently updates this repository with the latest Python versions
sudo add-apt-repository ppa:deadsnakes/ppa -y

# Update apt packages
sudo apt update -y

# Install python
sudo apt install -y python$version

# Install the Python development packages
sudo apt install -y python$version-dev build-essential

# Check python version
python$version --version

echo Python $version installation finished successfully.
read -p "Press Enter to continue..."
