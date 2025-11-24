add_library(my_suite_lib src/hello.cpp)

target_include_directories(my_suite_lib 
  PUBLIC 
    ${CMAKE_BINARY_DIR}/config   
    include
)

target_compile_features(my_suite_lib PUBLIC cxx_std_20)

if(BUILD_DOXYGEN)
  set(DOXYGEN_PROJECT_NAME "My Suite Library")
  set(DOXYGEN_INPUT "${CMAKE_CURRENT_SOURCE_DIR}/lib/my_suite_lib/include")
  set(DOXYGEN_OUTPUT "${CMAKE_BINARY_DIR}/docs/my_suite_lib")
    
  add_doxygen_target(my_suite_lib "${DOXYGEN_PROJECT_NAME}" "${DOXYGEN_INPUT}" "${DOXYGEN_OUTPUT}")
endif()
