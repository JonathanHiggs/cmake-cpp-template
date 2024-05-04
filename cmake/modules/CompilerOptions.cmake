## Setup Compile Options
message(TRACE "mylib::CompilerOptions")


if (MYLIB_COMPILER_CLANG)
    target_compile_options(
        mylib_base_target
        INTERFACE
            $<$<BOOL:${MYLIB_ENABLE_ASAN}>:-fsanitize=address>
            $<$<BOOL:${MYLIB_ENABLE_IPO}>:-flto=auto>
    )

    target_link_options(
        mylib_base_target
        INTERFACE
            -static-libgcc
            -static-libstdc++
            $<$<BOOL:${MYLIB_ENABLE_ASAN}>:-fsanitize=address>
    )

elseif(MYLIB_COMPILER_CLANGCL)
    target_compile_options(
        mylib_base_target
        INTERFACE
            $<$<BOOL:${MYLIB_ENABLE_ASAN}>:-fsanitize=address>
            $<$<BOOL:${MYLIB_ENABLE_IPO}>:-flto=auto>
    )

    target_link_options(
        mylib_base_target
        INTERFACE
            -static-libgcc
            -static-libstdc++
            $<$<BOOL:${MYLIB_ENABLE_ASAN}>:-fsanitize=address>
    )

elseif(MYLIB_COMPILER_GCC)
    target_compile_options(
        mylib_base_target
        INTERFACE
            $<$<BOOL:${MYLIB_ENABLE_ASAN}>:-fsanitize=address>
            $<$<BOOL:${MYLIB_ENABLE_IPO}>:-flto=auto>
    )

    target_link_options(
        mylib_base_target
        INTERFACE
            -static-libgcc
            -static-libstdc++
            $<$<BOOL:${MYLIB_ENABLE_ASAN}>:-fsanitize=address>
    )

elseif(MYLIB_COMPILER_MSVC)
    target_compile_definitions(
        mylib_base_target
        INTERFACE
            _SILENCE_ALL_MS_EXT_DEPRECATION_WARNINGS
            $<$<BOOL:${MYLIB_ENABLE_ASAN}>:_DISABLE_VECTOR_ANNOTATION _DISABLE_STRING_ANNOTATION>
    )

    target_compile_options(
        mylib_base_target
        INTERFACE
            $<$<CONFIG:DEBUG>:/FC>              # display full path in diagnostics
            $<$<CONFIG:DEBUG>:/Oi>              # replace calls with intrinsics
            $<$<CONFIG:DEBUG>:/Zi>              # generate complete debug info
            $<$<CONFIG:DEBUG>:/JMC>             # just my code
            $<$<CONFIG:RELEASE>:/Ot>            # prefer fast optimizations
            $<$<BOOL:${MYLIB_ENABLE_ASAN}>:/fsanitize=address /Zi /INCREMENTAL:NO>
            $<$<BOOL:${MYLIB_ENABLE_IPO}>:/GL>   # whole program optimization (IPO)
    )

    target_link_options(
        mylib_base_target
        INTERFACE
            $<IF:$<BOOL:${MYLIB_ENABLE_ASAN}>,/INCREMENTAL:NO,/INCREMENTAL>
    )

else()
    message(SEND_ERROR "CompilerOptions not supported for ${CMAKE_CXX_COMPILER_ID}")
endif()