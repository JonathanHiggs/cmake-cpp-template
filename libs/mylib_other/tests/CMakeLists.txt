add_executable(mylib_other_tests)

file(
    GLOB_RECURSE source_files
    CONFIGURE_DEPENDS
        "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

target_sources(mylib_other_tests PRIVATE ${source_files})

target_include_directories(
    mylib_other_tests
    PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
)

target_link_libraries(
    mylib_other_tests
    PRIVATE
        mylib::test_base_target
        mylib::other
)

gtest_discover_tests(mylib_other_tests DISCOVERY_MODE POST_BUILD)
