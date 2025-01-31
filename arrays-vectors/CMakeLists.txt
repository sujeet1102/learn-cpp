cmake_minimum_required(VERSION 3.15)
project(arrays-vectors)

# Set the output directories for build and debug
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build)

# Debug-specific linker flags
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} -Wl,-Map=${CMAKE_SOURCE_DIR}/debug/${PROJECT_NAME}.map")

# Add include directory
include_directories(${CMAKE_SOURCE_DIR}/include)

# Find all source files
file(GLOB_RECURSE SOURCES ${CMAKE_SOURCE_DIR}/src/*.cc)

# Define the executable
add_executable(${PROJECT_NAME} ${SOURCES})

# Compiler settings
# Add common warning flags
target_compile_options(${PROJECT_NAME} PRIVATE
    -Wall        # Enable all warnings
    -Wextra      # Enable extra warnings
    -Werror      # Treat warnings as errors
    -pedantic    # Enforce strict compliance with the standard
)

# Set optimization level for release builds
set(CMAKE_CXX_FLAGS_RELEASE "-O3") # Maximum optimizations

# Debug flags
set(CMAKE_CXX_FLAGS_DEBUG "-g -Og -DDEBUG") # Debug symbols and reduced optimization

# Specify C++ standard
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_17) # Use C++17

# Generate assembly listing (list file) for each source file
foreach(SOURCE_FILE ${SOURCES})
    get_filename_component(FILE_NAME ${SOURCE_FILE} NAME_WE)
    add_custom_command(
        TARGET ${PROJECT_NAME}
        POST_BUILD
        COMMAND ${CMAKE_CXX_COMPILER} -S -fverbose-asm ${SOURCE_FILE} -o ${CMAKE_SOURCE_DIR}/debug/${FILE_NAME}.list
        COMMENT "Generating assembly listing file for ${FILE_NAME}.cpp"
    )
endforeach()

# Generate objdump output
add_custom_command(
    TARGET ${PROJECT_NAME}
    POST_BUILD
    COMMAND objdump -d ${CMAKE_SOURCE_DIR}/build/${PROJECT_NAME} > ${CMAKE_SOURCE_DIR}/debug/${PROJECT_NAME}.objdump
    COMMENT "Generating objdump output"
)

# Add a custom clean target
add_custom_target(clean-all
    COMMAND ${CMAKE_COMMAND} -E rm -rf ${CMAKE_SOURCE_DIR}/build/* ${CMAKE_SOURCE_DIR}/debug/*
    COMMENT "Removing all build and debug files"
)