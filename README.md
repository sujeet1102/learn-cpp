# learn-cpp - Personal Quest of learning C++

## Project Documentation

### Overview
This repository contains multiple C++ projects organized in a structured way. Each project has its own directory with source files, headers, and build/debug outputs. This documentation explains how to build, run, and clean any project using provided shell scripts and CMake.  

NOTE: Only doing C++ specific concepts.

---

### Directory Structure

```
main-dir/
  ├── project1-folder/
  │   ├── src/          # Contains .cpp source files
  │   ├── include/      # Contains header files (.h or .hpp)
  │   ├── build/        # Contains build files and executables
  │   ├── debug/        # Contains debug-related files (e.g., map, list, objdump)
  ├── project2-folder/
  ├── build_project.sh  # Script to build a project
  ├── run_project.sh    # Script to run a project
  ├── clean_project.sh  # Script to clean a project
  ├── .gitignore        # Git ignore file
  ├── LICENSE           # License file
  └── README.md         # Documentation
```

---

### How to Build, Run, and Clean a Project

#### Using Shell Scripts

##### 1. Build a Project
```bash
./build_project.sh <project-name> [build-type]
```
- `<project-name>`: The name of the project directory (e.g., `project1-folder`).
- `[build-type]` (optional): `Debug` or `Release` (default is `Debug`).

Example:
```bash
./build_project.sh project1-folder Debug
```

##### 2. Run a Project
```bash
./run_project.sh <project-name>
```
- `<project-name>`: The name of the project directory.

Example:
```bash
./run_project.sh project1-folder
```

##### 3. Clean a Project
```bash
./clean_project.sh <project-name>
```
- `<project-name>`: The name of the project directory.

Example:
```bash
./clean_project.sh project1-folder
```
This cleans both the `build/` and `debug/` directories for the specified project.

---

#### Using CMake Commands

##### 1. Configure and Build
```bash
cmake -S <source-dir> -B <build-dir> -DCMAKE_BUILD_TYPE=<build-type>
cmake --build <build-dir>
```
- `<source-dir>`: Path to the project directory (e.g., `project1-folder`).
- `<build-dir>`: Path to the build directory (e.g., `project1-folder/build`).
- `<build-type>`: `Debug` or `Release`.

Example:
```bash
cmake -S project1-folder -B project1-folder/build -DCMAKE_BUILD_TYPE=Debug
cmake --build project1-folder/build
```

##### 2. Run the Executable
```bash
<build-dir>/<project-name>
```
Example:
```bash
project1-folder/build/project1-folder
```

##### 3. Clean Build Files
```bash
cmake --build <build-dir> --target clean
```
Example:
```bash
cmake --build project1-folder/build --target clean
```

---

### Notes
- Ensure you have `cmake`, `g++`, and `objdump` installed on your system.
- Scripts assume the current working directory is the base directory (`main-dir`).
