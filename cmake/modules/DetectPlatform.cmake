## Detect platform and create `MYLIB_PLATFORM_DEFINITIONS` variable
message(TRACE "mylib::DetectPlatform")


set(MYLIB_PLATFORM_DEFINITIONS "")


# Platform
message(TRACE "CMAKE_SYSTEM_NAME: ${CMAKE_SYSTEM_NAME}")

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(MYLIB_PLATFORM_LINUX     TRUE)
    set(MYLIB_PLATFORM_WINDOWS   FALSE)
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_PLATFORM_LINUX")

elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(MYLIB_PLATFORM_LINUX     FALSE)
    set(MYLIB_PLATFORM_WINDOWS   TRUE)
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_PLATFORM_WINDOWS")

else()
    message(FATAL_ERROR "Unsupported platform: ${CMAKE_SYSTEM_NAME}")
endif()


# Compiler
message(TRACE "CMAKE_CXX_COMPILER:                  ${CMAKE_CXX_COMPILER}")
message(TRACE "CMAKE_CXX_COMPILER_ID:               ${CMAKE_CXX_COMPILER_ID}")
message(TRACE "CMAKE_CXX_COMPILER_FRONTEND_VARIANT: ${CMAKE_CXX_COMPILER_FRONTEND_VARIANT}")
message(TRACE "CMAKE_CXX_COMPILER_VERSION:          ${CMAKE_CXX_COMPILER_VERSION}")

if(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang.*" AND MYLIB_PLATFORM_LINUX)
    set(MYLIB_COMPILER_CLANG     TRUE)
    set(MYLIB_COMPILER_CLANGCL   FALSE)
    set(MYLIB_COMPILER_GCC       FALSE)
    set(MYLIB_COMPILER_MSVC      FALSE)
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_COMPILER_CLANG")

elseif(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang.*" AND MYLIB_PLATFORM_WINDOWS)
    set(MYLIB_COMPILER_CLANG     FALSE)
    set(MYLIB_COMPILER_CLANGCL   TRUE)
    set(MYLIB_COMPILER_GCC       FALSE)
    set(MYLIB_COMPILER_MSVC      FALSE)
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_COMPILER_CLANG")

elseif(CMAKE_CXX_COMPILER_ID MATCHES ".*GNU.*")
    set(MYLIB_COMPILER_CLANG     FALSE)
    set(MYLIB_COMPILER_CLANGCL   FALSE)
    set(MYLIB_COMPILER_GCC       TRUE)
    set(MYLIB_COMPILER_MSVC      FALSE)
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_COMPILER_GCC")

elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    set(MYLIB_COMPILER_CLANG     FALSE)
    set(MYLIB_COMPILER_CLANGCL   FALSE)
    set(MYLIB_COMPILER_GCC       FALSE)
    set(MYLIB_COMPILER_MSVC      TRUE)
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_COMPILER_MSVC")

    message(TRACE "MYLIB_COMPILER_MSVC_VERSION: ${MYLIB_COMPILER_MSVC_VERSION}")
    set(MYLIB_COMPILER_MSVC_VERSION ${MSVC_VERSION})
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_COMPILER_MSVC_VERSION=${MSVC_VERSION}")

else()
    message(FATAL_ERROR "Unsupported compiler: ${CMAKE_CXX_COMPILER_ID}")
endif()


# C++ Standard Version
message(TRACE "CMAKE_CXX_STANDARD: ${CMAKE_CXX_STANDARD}")

if (CMAKE_CXX_STANDARD STREQUAL "23")
    set(MYLIB_STD_VERSION 23)
    list(APPEND MYLIB_HAS_CXX23)
    list(APPEND MYLIB_HAS_CXX20)
    list(APPEND MYLIB_HAS_CXX17)
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_HAS_CXX17" "MYLIB_HAS_CXX20" "MYLIB_HAS_CXX23")

elseif(CMAKE_CXX_STANDARD STREQUAL "20")
    list(APPEND MYLIB_HAS_CXX20)
    list(APPEND MYLIB_HAS_CXX17)
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_HAS_CXX17" "MYLIB_HAS_CXX20")

elseif(CMAKE_CXX_STANDARD STREQUAL "17")
    list(APPEND MYLIB_HAS_CXX17)
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_HAS_CXX17")

else()
    message(FATAL_ERROR "Unknown CXX standard: ${CMAKE_CXX_STANDARD}")
endif()


# Build variant
message(TRACE "CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(MYLIB_BUILD_DEBUG        TRUE)
    set(MYLIB_BUILD_RELEASE      FALSE)
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_BUILD_DEBUG")

elseif(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo" OR CMAKE_BUILD_TYPE STREQUAL "Release")
    set(MYLIB_BUILD_DEBUG        FALSE)
    set(MYLIB_BUILD_RELEASE      TRUE)
    list(APPEND MYLIB_PLATFORM_DEFINITIONS "MYLIB_BUILD_RELEASE")

else()
    message(FATAL_ERROR "Unknown build type: ${CMAKE_BUILD_TYPE}")
endif()


message(STATUS "MYLIB platform definitions:")

foreach(DEF IN LISTS MYLIB_PLATFORM_DEFINITIONS)
    message(STATUS "  ${DEF}")
endforeach()