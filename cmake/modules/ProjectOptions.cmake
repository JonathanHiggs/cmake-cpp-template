## MYLIB project options
message(TRACE "mylib::ProjectOptions")


# Compiler dependent feature support
if (MYLIB_COMPILER_CLANG)
    set(MYLIB_SUPPORTS_ASAN       ON)
    set(MYLIB_SUPPORTS_COVERAGE   OFF)
    set(MYLIB_SUPPORTS_UBSAN      ON)

elseif (MYLIB_COMPILER_CLANGCL)
    set(MYLIB_SUPPORTS_ASAN       OFF)
    set(MYLIB_SUPPORTS_COVERAGE   OFF)
    set(MYLIB_SUPPORTS_UBSAN      OFF)

elseif (MYLIB_COMPILER_GCC)
    set(MYLIB_SUPPORTS_ASAN       ON)
    set(MYLIB_SUPPORTS_COVERAGE   OFF)
    set(MYLIB_SUPPORTS_UBSAN      ON)

elseif (MYLIB_COMPILER_MSVC)
    set(MYLIB_SUPPORTS_ASAN       ON)
    set(MYLIB_SUPPORTS_COVERAGE   OFF)
    set(MYLIB_SUPPORTS_UBSAN      OFF)

endif()

include(CheckIPOSupported)
check_ipo_supported(RESULT result OUTPUT output)
if (result)
    set(MYLIB_SUPPORTS_IPO ON)
else()
    set(MYLIB_SUPPORTS_IPO OFF)
endif()

message(TRACE "MYLIB supported options:")
message(TRACE "  MYLIB_SUPPORTS_ASAN                      ${MYLIB_SUPPORTS_ASAN}")
message(TRACE "  MYLIB_SUPPORTS_COVERAGE                  ${MYLIB_SUPPORTS_COVERAGE}")
message(TRACE "  MYLIB_SUPPORTS_UBSAN                     ${MYLIB_SUPPORTS_UBSAN}")
message(TRACE "  MYLIB_SUPPORTS_IPO                       ${MYLIB_SUPPORTS_IPO}")


# Option defaults
set(MYLIB_BUILD_TESTS_DEFAULT         OFF)
set(MYLIB_ENABLE_ASAN_DEFAULT         OFF)
set(MYLIB_ENABLE_COVERAGE_DEFAULT     OFF)
set(MYLIB_ENABLE_UBSAN_DEFAULT        OFF)
set(MYLIB_ENABLE_IPO_DEFAULT          ${MYLIB_SUPPORTS_IPO})

if (MYLIB_BUILD_DEBUG)
    set(MYLIB_ENABLE_ASSERTS_DEFAULT  ON)
else()
    set(MYLIB_ENABLE_ASSERTS_DEFAULT  OFF)
endif()

if (PROJECT_IS_TOP_LEVEL)
    set(MYLIB_ENABLE_WARNINGS_AS_ERRORS   ON)
else()
    set(MYLIB_ENABLE_WARNINGS_AS_ERRORS   OFF)
endif()

message(TRACE "MYLIB option defaults:")
message(TRACE "  MYLIB_BUILD_TESTS_DEFAULT                ${MYLIB_BUILD_TESTS_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_ASAN_DEFAULT                ${MYLIB_ENABLE_ASAN_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_ASSERTS_DEFAULT             ${MYLIB_ENABLE_ASSERTS_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_COVERAGE_DEFAULT            ${MYLIB_ENABLE_COVERAGE_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_IPO_DEFAULT                 ${MYLIB_ENABLE_IPO_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_UBSAN_DEFAULT               ${MYLIB_ENABLE_UBSAN_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_WARNINGS_AS_ERRORS_DEFAULT  ${MYLIB_ENABLE_WARNINGS_AS_ERRORS_DEFAULT}")


# Read options
option(MYLIB_BUILD_TESTS                  "Enable building tests"                 ${MYLIB_BUILD_TESTS_DEFAULT})
option(MYLIB_ENABLE_ASAN                  "Enable address sanitizer"              ${MYLIB_ENABLE_ASAN_DEFAULT})
option(MYLIB_ENABLE_ASSERTS               "Enable debug asserts"                  ${MYLIB_ENABLE_ASSERTS_DEFAULT})
option(MYLIB_ENABLE_COVERAGE              "Enable test coverage reporting"        ${MYLIB_ENABLE_COVERAGE_DEFAULT})
option(MYLIB_ENABLE_IPO                   "Enable IPO/LTO"                        ${MYLIB_ENABLE_IPO_DEFAULT})
option(MYLIB_ENABLE_UBSAN                 "Enable undefined behaviour sanitizer"  ${MYLIB_ENABLE_UBSAN_DEFAULT})
option(MYLIB_ENABLE_WARNINGS_AS_ERRORS    "Enable warnings-as-errors"             ${MYLIB_ENABLE_WARNINGS_AS_ERRORS_DEFAULT})

message(STATUS "MYLIB option:")
message(STATUS "  MYLIB_BUILD_TESTS                       ${MYLIB_BUILD_TESTS}")
message(STATUS "  MYLIB_ENABLE_ASAN                       ${MYLIB_ENABLE_ASAN}")
message(STATUS "  MYLIB_ENABLE_ASSERTS                    ${MYLIB_ENABLE_ASSERTS}")
message(STATUS "  MYLIB_ENABLE_COVERAGE                   ${MYLIB_ENABLE_COVERAGE}")
message(STATUS "  MYLIB_ENABLE_IPO                        ${MYLIB_ENABLE_IPO}")
message(STATUS "  MYLIB_ENABLE_UBSAN                      ${MYLIB_ENABLE_UBSAN}")
message(STATUS "  MYLIB_ENABLE_WARNINGS_AS_ERRORS         ${MYLIB_ENABLE_WARNINGS_AS_ERRORS}")
