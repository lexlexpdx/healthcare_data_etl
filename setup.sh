#!/usr/bin/env bash

# Define name of venv folder
VENV_DIR="venv"

echo "Checking Python installation"
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
else
    echo "Error: Python is not installed on this system."
    return 1 2>/dev/null || exit 1
fi

# Create Virtual Environment if the directory doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment in: $VENV_DIR..."
    $PYTHON_CMD -m venv "$VENV_DIR"
else
    echo "Virtual environment already exists"
fi

# Upgrade pip and setup tools
echo "Upgrading base packages"
pip install --upgrade pip setuptools wheel

# Install dependencies if a requirements file is present
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip install -r requirements.txt
fi

echo "Setup complete! To activate your virtual environment run: source $VENV_DIR/bin/activate"