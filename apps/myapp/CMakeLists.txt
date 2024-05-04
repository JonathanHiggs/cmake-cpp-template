add_executable(myapp)

file(
    GLOB_RECURSE source_files
    CONFIGURE_DEPENDS
        "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

target_sources(myapp PRIVATE ${source_files})

target_include_directories(
    myapp
    PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/src>
)

target_link_libraries(
    myapp
    PRIVATE
        mylib::mylib
)