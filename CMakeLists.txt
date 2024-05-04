cmake_minimum_required(VERSION 3.25)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")


## Setup toolchain

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
include(TestingSetup)

# ToDo: Sanatizers, Coverage, GitInfo


## Targets

add_subdirectory(libs)

if(MYLIB_BUILD_APPS)
    add_subdirectory(apps)
endif()

# ToDo: docs

if(MYLIB_BUILD_EXAMPLES)
    add_subdirectory(examples)
endif()


## Install

include(InstallSetup)