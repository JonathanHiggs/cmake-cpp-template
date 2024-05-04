# Configures vcpkg manifest features based on the current build configuration

if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    if(NOT DEFINED "$ENV{VCPKG_ROOT}" OR "$ENV{VCPKG}" STREQUAL "")
        message(FATAL_ERROR "Unable to setup vcpkg, ensure \"VCPKG_ROOT\" is configured as an environment variable")
    endif()

    set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystem/vcpkg.cmake" CACHE)
endif()


if(MYLIB_BUILD_APPS)
    list(APPEND VCPKG_MANIFEST_FEATURES "apps")
endif()

if(MYLIB_BUILD_EXAMPLES)
    list(APPEND VCPKG_MANIFEST_FEATURES "examples")
endif()

if(MYLIB_BUILD_TESTS)
    list(APPEND VCPKG_MANIFEST_FEATURES "tests")
endif()
