add_library(my_suite_lib src/hello.cpp)

target_include_directories(my_suite_lib 
  PUBLIC  
    include
  PRIVATE
    ${CMAKE_BINARY_DIR}/config  
)

target_compile_features(my_suite_lib PUBLIC cxx_std_20)
