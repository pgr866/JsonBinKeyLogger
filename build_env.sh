#!/bin/bash

# BUILD PYTHON ENVIRONMENT

echo "Installing Python..."
cd tools
./install_python.sh

echo "Creating virtual environment..."
./install_venv.sh

echo "Installing requirements..."
./install_requirements.sh

echo "Environment setup completed."
echo
read -p "Press Enter to continue..."
