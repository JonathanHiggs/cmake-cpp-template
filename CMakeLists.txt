cmake_minimum_required(VERSION 3.25)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")

include(VcpkgSetup)


## Project Setup

file(READ "version.txt" MYLIB_VERSION)

project(
    mylib
    VERSION ${MYLIB_VERSION}
    DESCRIPTION "Description of mylib"
    HOMEPAGE_URL "https://github.com/JonathanHiggs/mylib"
    LANGUAGES CXX
)


## Configure build

include(StandardSettings)
include(DetectPlatform)
include(ProjectOptions)
include(InterfaceTargets)
include(Dependencies)

if(MYLIB_BUILD_TESTS)
    include(GoogleTest)
    enable_testing()
endif()

# ToDo: Sanatizers, Coverage, GitInfo


## Targets

add_subdirectory(libs)


## Install

# ToDo: install