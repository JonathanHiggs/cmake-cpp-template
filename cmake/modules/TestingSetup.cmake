## Configure testing
message(TRACE "mylib::TestingSetup")


if(MYLIB_BUILD_TESTS)
    include(GoogleTest)
    enable_testing()
endif()