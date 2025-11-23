function(add_project_gtest test_file_path test_file_prefix test_lib)
  string(REPLACE "/" "_" test_file_path_underscore ${test_file_path})
  set(test_name "${test_file_path_underscore}_${test_file_prefix}")
  add_executable(${test_name} ${test_file_path}/${test_file_prefix}.cpp)
  target_link_libraries(${test_name}
    PRIVATE
        GTest::gtest_main
        ${test_lib}
  )
  set_target_properties(${test_name} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${TEST_RUNTIME_OUTPUT_DIRECTORY}
  )
  add_test(NAME ${test_name} COMMAND ${test_name})
  set_tests_properties(${test_name} PROPERTIES LABELS "${test_lib}")
endfunction()