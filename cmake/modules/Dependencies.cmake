## Setup project dependencies
message(TRACE "mylib::Dependencies")


find_package(fmt            CONFIG REQUIRED)
find_package(spdlog::spdlog CONFIG REQUIRED)


if(QPL_BUILD_TESTS)
    find_package(GTest      CONFIG REQUIRED)
endif()