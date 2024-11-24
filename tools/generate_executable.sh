#!/bin/bash

# GENERATE EXECUTABLE

# Change the current working directory to the directory where the bash script is located
cd "$(dirname "$0")"
cd ..

# Python venv path
python="$(pwd)/venv/bin/python"

# Install pyinstaller
$python -m pip install -U pyinstaller

# pyinstaller path
pyinstaller="$(pwd)/venv/bin/pyinstaller"

# config.spec path
spec="$(pwd)/tools/config.spec"

# Generate executable
$pyinstaller $spec

mv dist/SecurityHealthService .
rm -r build
rm -r dist

echo
read -p "Press Enter to continue..."
