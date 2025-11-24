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

set(CONFIG_JSON "${CMAKE_SOURCE_DIR}/config/config.json")
set(CONFIG_HEADER "${CMAKE_BINARY_DIR}/config/config.h")

file(MAKE_DIRECTORY "${CMAKE_BINARY_DIR}/config")
add_custom_command(
    OUTPUT "${CONFIG_HEADER}"
    COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/cmake/json_to_header.py
            "${CONFIG_JSON}" "${CONFIG_HEADER}"
    DEPENDS "${CONFIG_JSON}" "${CMAKE_SOURCE_DIR}/cmake/json_to_header.py"
    COMMENT "Generating config.h from config.json"
)
add_custom_target(generate_config ALL DEPENDS "${CONFIG_HEADER}")
include_directories("${CMAKE_BINARY_DIR}/config")

if(BUILD_DOXYGEN)
    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
    include(DoxygenUtilities)
endif()

add_subdirectory(lib/mylib)
add_subdirectory(src)

if (BUILD_TESTS)
    enable_testing()
    add_subdirectory(external/googletest)
    add_subdirectory(tests)
endif()

add_subdirectory(suites/my_suite)
