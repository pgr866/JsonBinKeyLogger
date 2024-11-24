#!/bin/bash

# RUN MAIN.PY

# Change the current working directory to the directory where the bash script is located
cd "$(dirname "$0")"

# Python venv path
python="$(pwd)/venv/bin/python"

# Run main.py
$python main.py
