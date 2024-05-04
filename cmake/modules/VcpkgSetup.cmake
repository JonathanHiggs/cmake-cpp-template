# Configures vcpkg manifest features based on the current build configuration

if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystem/vcpkg.cmake" GLOBAL CACHE)
endif


if(MYLIB_BUILD_TESTS)
    list(APPEND VCPKG_MANIFEST_FEATURES "tests")
endif()
