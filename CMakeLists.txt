cmake_minimum_required(VERSION 3.20)

project(my_project
    VERSION 0.1.0
    DESCRIPTION "A learning project with modern CMake"
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(BUILD_DOXYGEN "Build Doxygen documentation" ON)
option(BUILD_TESTS "Build tests" ON)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

if(BUILD_DOXYGEN)
    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
    include(DoxygenUtilities)
endif()

add_subdirectory(lib/mylib)
add_subdirectory(src)

if (BUILD_TESTS)
    set(TEST_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/tests)

    enable_testing()
    add_subdirectory(external/googletest)
    add_subdirectory(tests)
endif()
