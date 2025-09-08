add_executable(my_project main.cpp)

target_link_libraries(my_project PRIVATE mylib)

target_compile_features(my_project PRIVATE cxx_std_20)
target_compile_options(my_project PRIVATE -Wall -Wextra -Wpedantic)