# Standard project and compiler settings
message(TRACE "mylib::StandardSettings")


# Set default build type to 'Release' when not specified
if(NOT DEFINED CMAKE_BUILD_TYPE AND NOT DEFINED CMAKE_CONFIGURATION_TYPES)
    message(STATUS "No build type specified, default set to 'Release'")

    set(CMAKE_BUILD_TYPE "Release"
        CACHE STRING "Choose the type of build, options are: Debug RelWithDebInfo Release MinSizeRel"
        FORCE
    )

    # Set build type options for cmake-gui
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "RelWithDebInfo" "Release" "MinSizeRel")
endif()


# c++ settings
if(NOT DEFINED CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD 20)
endif()

set(CMAKE_CXX_EXTENSIONS OFF)


# Ensure 'compile_commands.json' is generated
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


# Improve error reporting
if(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang.*" OR CMAKE_CXX_COMPILER_ID MATCHES ".*GCC.*")
    add_compile_options(
        $<$<COMPILE_LANGUAGE:C>:-fcolor-diagnostics>
        $<$<COMPILE_LANGUAGE:CXX>:-fcolor-diagnostics>
    )
endif()

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    add_compile_options(/diagnostics:column)
endif()



if(DEFINED MYLIB_BUILD_SHARED)
    set(BUILD_SHARED_LIBS ${MYLIB_BUILD_SHARED})
endif()

if(NOT DEFINED CMAKE_CXX_VISIBILITY_PRESET)
    set(CMAKE_CXX_VISIBILITY_PRESET hidden)
endif()

if(NOT DEFINED CMAKE_VISIBILITY_INLINES_HIDDEN)
    set(CMAKE_VISIBILITY_INLINES_HIDDEN ON)
endif()