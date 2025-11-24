add_subdirectory(lib/my_suite_lib)
add_subdirectory(src)

if (BUILD_TESTS)
  add_subdirectory(tests)
endif()