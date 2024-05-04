## Setup Interface Targets
message(TRACE "mylib::InterfaceTargets")


add_library(mylib_base_target INTERFACE)
add_library(mylib::base_target ALIAS mylib_base_target)

target_compile_features(mylib_base_target INTERFACE cxx_std_${CMAKE_CXX_STANDARD})


if (MYLIB_BUILD_TESTS)
    add_library(mylib_test_base_target INTERFACE)
    add_library(mylib::test_base_target ALIAS mylib_test_base_target)

    target_link_libraries(mylib_test_base_target INTERFACE mylib_base_target)
endif()


include(CompilerDefinitions)
include(CompilerOptions)
include(CompilerWarnings)