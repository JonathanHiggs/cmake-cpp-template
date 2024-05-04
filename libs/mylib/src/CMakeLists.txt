add_library(mylib STATIC)
add_library(mylib::mylib ALIAS mylib)


# Generate templates
set(MYLIB_METADATA_PREFIX "MYLIB::METADATA::")

configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/templates/Version.hpp.in"
    "${CMAKE_CURRENT_BINARY_DIR}/include/mylib/Version.hpp.in"
    @ONLY
)


# Add source files
file(
    GLOB_RECURSE source_files 
    CONFIGURE_DEPENDS
        "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

file(
    GLOB_RECURSE header_files 
    CONFIGURE_DEPENDS
        "${CMAKE_CURRENT_SOURCE_DIR}/src/*.hpp"
        "${CMAKE_CURRENT_BINARY_DIR}/include/*.hpp"
)

target_sources(mylib PRIVATE ${SOURCE_FILES})


# Setup target
target_include_directories(
    mylib
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

target_link_options(
    mylib
    PRIVATE
        $<$<PLATFORM_ID:Linux>:-static-libgcc>
        $<$<PLATFORM_ID:Linux>:-static-libstdc++> 
)

target_link_libraries(
    mylib
    PRIVATE
        mylib::definitions
        mylib::options
        mylib::warnings
    PUBLIC
        fmt::fmt
        spdlog::spdlog
)