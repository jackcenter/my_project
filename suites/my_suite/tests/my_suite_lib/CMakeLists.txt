set(CURRENT_LIBRARY_NAME "my_suite_lib")
set(TEST_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/tests/my_suite/my_suite_lib)

add_project_gtest(${CMAKE_CURRENT_SOURCE_DIR} test_hello ${CURRENT_LIBRARY_NAME})
