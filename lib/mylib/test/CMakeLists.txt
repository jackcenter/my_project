list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(Utilities)

add_project_gtest(unit test_hello ${CURRENT_LIBRARY_NAME})