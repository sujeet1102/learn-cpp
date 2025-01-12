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
if [ ! -d "$BUILD_DIR" ]; then
    echo "Error: Build directory for '$PROJECT_NAME' does not exist. Build the project first."
    exit 1
fi

# Run the executable
EXECUTABLE="${BUILD_DIR}/${PROJECT_NAME}"
if [ -f "$EXECUTABLE" ]; then
    echo "Running project '$PROJECT_NAME'..."
    "$EXECUTABLE"
else
    echo "Error: Executable not found for '$PROJECT_NAME'."
    exit 1
fi
