add_library(mylib src/hello.cpp)

target_include_directories(mylib PUBLIC include)

target_compile_features(mylib PUBLIC cxx_std_20)

if(BUILD_DOXYGEN)
    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
    include(DoxygenUtilities)

    set(DOXYGEN_PROJECT_NAME "My Library")
    set(DOXYGEN_INPUT "${CMAKE_CURRENT_SOURCE_DIR}/include")
    set(DOXYGEN_OUTPUT "${CMAKE_BINARY_DIR}/docs/mylib")
    
    add_doxygen_target(mylib "${DOXYGEN_PROJECT_NAME}" "${DOXYGEN_INPUT}" "${DOXYGEN_OUTPUT}")
endif()

if (BUILD_TESTS)
    set(CURRENT_LIBRARY_NAME mylib)
    add_subdirectory(test)
endif()
