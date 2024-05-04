add_executable(mylib_tests)

file(
    GLOB_RECURSE source_files 
    CONFIGURE_DEPENDS
        "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

target_include_directories(
    mylib_tests
    PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
)

target_link_libraries(
    mylib_tests
    PRIVATE
        mylib::test_base_target
        mylib::mylib
        GTest::gtest
        GTest::gtest_main
)

gtest_discover_tests(mylib_tests DISCOVERY_MODE POST_BUILD)
