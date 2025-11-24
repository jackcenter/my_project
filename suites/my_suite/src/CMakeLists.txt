add_executable(my_suite_project main.cpp)

target_link_libraries(my_suite_project PRIVATE my_suite_lib)

target_compile_features(my_suite_project PRIVATE cxx_std_20)
target_compile_options(my_suite_project PRIVATE -Wall -Wextra -Wpedantic)