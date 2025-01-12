# CMake Concepts Used

## 1. Minimum CMake Version
```cmake
cmake_minimum_required(VERSION 3.15)
```
Specifies the minimum required version of CMake to ensure compatibility.

## 2. Project Declaration
```cmake
project(<project-name>)
```
Defines the name of the project.

## 3. Output Directories
```cmake
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build)
```
Configures output directories for executables, archives, and libraries.

## 4. Debug-Specific Output
```cmake
set(CMAKE_DEBUG_POSTFIX "_debug")
```
Adds a postfix to output files built in Debug mode.

## 5. Include Directories
```cmake
include_directories(${CMAKE_SOURCE_DIR}/include)
```
Specifies the directory containing header files.

## 6. File Glob for Source Files
```cmake
file(GLOB_RECURSE SOURCES ${CMAKE_SOURCE_DIR}/src/*.cpp)
```
Collects all `.cpp` files in the `src/` directory and its subdirectories.

## 7. Add Executable
```cmake
add_executable(${PROJECT_NAME} ${SOURCES})
```
Defines the output executable target and associates it with the source files.

## 8. Compiler Options
```cmake
target_compile_options(${PROJECT_NAME} PRIVATE
    -Wall -Wextra -Werror -pedantic
)
```
Sets compiler flags to enable warnings and enforce strict compliance.

## 9. Build Type and Optimization
```cmake
set(CMAKE_CXX_FLAGS_RELEASE "-O3")
set(CMAKE_CXX_FLAGS_DEBUG "-g -Og -DDEBUG")
```
Defines optimization and debugging flags for Release and Debug builds.

## 10. Custom Commands for Debug Files
### Generate Assembly Listing
```cmake
add_custom_command(
    TARGET ${PROJECT_NAME}
    POST_BUILD
    COMMAND ${CMAKE_CXX_COMPILER} -S -fverbose-asm ${CMAKE_SOURCE_DIR}/src/*.cpp -o ${CMAKE_SOURCE_DIR}/debug/${PROJECT_NAME}.list
    COMMENT "Generating assembly listing file"
)
```
Generates a human-readable assembly listing after building.

### Generate Objdump Output
```cmake
add_custom_command(
    TARGET ${PROJECT_NAME}
    POST_BUILD
    COMMAND objdump -d ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME} > ${CMAKE_SOURCE_DIR}/debug/${PROJECT_NAME}.objdump
    COMMENT "Generating objdump output"
)
```
Generates a disassembled output of the executable.

---