add_library(mylib)
add_library(mylib::mylib ALIAS mylib)


##  Generate templates

set(_library_name "mylib")
set(_export_file_name "${_library_name}_export_shared.hpp")
if(NOT BUILD_SHARED_LIBS)
   set(_export_file_name "${_library_name}_export_static.hpp")
endif()

include(GenerateExportHeader)
generate_export_header(
    mylib 
    EXPORT_FILE_NAME "include/${_library_name}/${_export_file_name}"
)


configure_file(
    "${CMAKE_SOURCE_DIR}/cmake/templates/lib_export.hpp.in"
    "${CMAKE_CURRENT_BINARY_DIR}/include/${_library_name}/${_library_name}_export.hpp"
    @ONLY
)


set(MYLIB_METADATA_PREFIX "MYLIB::METADATA::")
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/templates/version.hpp.in"
    "${CMAKE_CURRENT_BINARY_DIR}/include/${_library_name}/version.hpp"
    @ONLY
)

unset(MYLIB_METADATA_PREFIX)
unset(_export_file_name)
unset(_library_name)


## Source files

file(
    GLOB_RECURSE source_files 
    CONFIGURE_DEPENDS
        "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

file(
    GLOB_RECURSE header_files
    CONFIGURE_DEPENDS
        "${CMAKE_CURRENT_SOURCE_DIR}/src/*.hpp"
)

file(
    GLOB_RECURSE generated_files
    CONFIGURE_DEPENDS
        "${CMAKE_CURRENT_BINARY_DIR}/include/*.hpp"
)

source_group(
    TREE "${CMAKE_CURRENT_SOURCE_DIR}/src"
    FILES ${source_files} ${header_files}
)

target_sources(
    mylib 
    PRIVATE
        ${source_files}
    PUBLIC FILE_SET HEADERS 
        BASE_DIRS
            ${CMAKE_CURRENT_SOURCE_DIR}/src
            ${CMAKE_CURRENT_BINARY_DIR}/include
        FILES ${header_files} ${generated_files}
)


##  Setup target

target_compile_definitions(
    mylib
    PUBLIC "$<$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>:mylib_STATIC_DEFINE>"
)

# target_include_directories(
#     mylib
#     PUBLIC
#         $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
#         $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
#         $<INSTALL_INTERFACE:include>
# )

target_link_libraries(
    mylib
    PUBLIC
        mylib::base_target
        fmt::fmt
        spdlog::spdlog
)

set_target_properties(
    mylib
    PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
)
