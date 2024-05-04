add_subdirectory(lib)

if(MYLIB_BUILD_TESTS)
    add_subdirectory(tests)
endif()