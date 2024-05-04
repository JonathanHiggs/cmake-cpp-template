## Setup Compiler Definitions
message(TRACE "mylib::CompilerDefinitions")


target_compile_definitions(
    mylib_base_target
    INTERFACE
        ${MYLIB_PLATFORM_DEFINITIONS}
        $<$<BOOL:${MYLIB_ENABLE_ASSERTS}>:MYLIB_ENABLE_ASSERTS>
)

if (MYLIB_BUILD_TESTS)
    target_compile_definitions(
        mylib_test_base_target
        INTERFACE
            MYLIB_IS_TEST
    )
endif()