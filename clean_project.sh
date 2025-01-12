#!/bin/bash

# Define the base directory for your projects
BASE_DIR=$(pwd)

# Check if a project name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <project-name>"
    echo "Available projects:"
    ls -d ${BASE_DIR}/*/ | xargs -n 1 basename
    exit 1
fi

PROJECT_NAME="$1"
BUILD_DIR="${BASE_DIR}/${PROJECT_NAME}/build"

# Ensure the build directory exists
if [ -d "$BUILD_DIR" ]; then
    echo "Cleaning build directory for project '$PROJECT_NAME' using CMake..."
    cmake --build "$BUILD_DIR" --target clean-all
else
    echo "Build directory for '$PROJECT_NAME' does not exist. Nothing to clean."
fi

echo "Clean-up completed!"
