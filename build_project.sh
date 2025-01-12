#!/bin/bash

# Define the base directory for your projects
BASE_DIR=$(pwd)

# Check if a project name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <project-name> [build-type]"
    echo "Available projects:"
    ls -d ${BASE_DIR}/*/ | xargs -n 1 basename
    exit 1
fi

PROJECT_NAME="$1"
BUILD_TYPE="${2:-Debug}" # Default to Debug if not specified

# Set project directories
SOURCE_DIR="${BASE_DIR}/${PROJECT_NAME}"
BUILD_DIR="${SOURCE_DIR}/build"

# Ensure the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo $SOURCE_DIR
    echo "Error: Project '$PROJECT_NAME' does not exist."
    exit 1
fi

# Create or clean the build directory
if [ -d "$BUILD_DIR" ]; then
    echo "Cleaning existing build directory..."
    rm -rf "$BUILD_DIR"
fi
mkdir -p "$BUILD_DIR"

# Run CMake configuration and build
echo "Configuring and building project '$PROJECT_NAME' in $BUILD_TYPE mode..."
cmake -S "$SOURCE_DIR" -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE="$BUILD_TYPE"
cmake --build "$BUILD_DIR"

# Notify completion
if [ $? -eq 0 ]; then
    echo "Build successful!"
else
    echo "Build failed!"
    exit 1
fi
