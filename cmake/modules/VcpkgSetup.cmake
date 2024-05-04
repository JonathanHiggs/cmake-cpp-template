# Configures vcpkg manifest features based on the current build configuration
message(TRACE "mylib::VcpkgSetup")


if(MYLIB_ENABLE_VCPKG)
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

    mark_as_advanced(CMAKE_TOOLCHAIN_FILE)
    mark_as_advanced(VCPKG_MANIFEST_FEATURES)

    message(STATUS "CMAKE_TOOLCHAIN_FILE:       ${CMAKE_TOOLCHAIN_FILE}")
    message(STATUS "VCPKG_MANIFEST_FEATURES:    ${VCPKG_MANIFEST_FEATURES}")
endif()