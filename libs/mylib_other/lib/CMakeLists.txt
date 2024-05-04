add_library(mylib_other)
add_library(mylib::other ALIAS mylib_other)


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

source_group(
    TREE "${CMAKE_CURRENT_SOURCE_DIR}/src"
    FILES ${source_files} ${header_files}
)

target_sources(
    mylib_other 
    PRIVATE
        ${source_files}
    PUBLIC FILE_SET HEADERS 
        BASE_DIRS
            ${CMAKE_CURRENT_SOURCE_DIR}/src
        FILES ${header_files}
)


##  Setup target

target_link_libraries(
    mylib_other
    PUBLIC
        mylib::mylib
)

set_target_properties(
    mylib_other
    PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
)

