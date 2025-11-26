add_library(mylib src/hello.cpp)

find_package(fmt REQUIRED)

add_dependencies(mylib generate_config)

target_include_directories(mylib 
  PUBLIC 
    include
  PRIVATE
    ${CMAKE_BINARY_DIR}/config 
)

target_link_libraries(mylib
  PRIVATE
    fmt::fmt
)

target_compile_features(mylib PUBLIC cxx_std_20)
