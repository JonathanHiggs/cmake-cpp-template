## Setup project dependencies
message(TRACE "mylib::Dependencies")


find_package(fmt            CONFIG REQUIRED)
find_package(spdlog         CONFIG REQUIRED)


if(MYLIB_BUILD_TESTS)
    find_package(GTest      CONFIG REQUIRED)
endif()