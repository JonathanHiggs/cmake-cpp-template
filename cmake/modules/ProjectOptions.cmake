## MYLIB project options
message(TRACE "mylib::ProjectOptions")


## Compiler dependent feature support

if (MYLIB_COMPILER_CLANG)
    set(MYLIB_SUPPORTS_ASAN         ON)
    set(MYLIB_SUPPORTS_CLANG_TIDY   ON)
    set(MYLIB_SUPPORTS_COVERAGE     OFF)
    set(MYLIB_SUPPORTS_UBSAN        ON)

elseif (MYLIB_COMPILER_CLANGCL)
    set(MYLIB_SUPPORTS_ASAN         OFF)
    set(MYLIB_SUPPORTS_CLANG_TIDY   ON)
    set(MYLIB_SUPPORTS_COVERAGE     OFF)
    set(MYLIB_SUPPORTS_UBSAN        OFF)

elseif (MYLIB_COMPILER_GCC)
    set(MYLIB_SUPPORTS_ASAN         ON)
    set(MYLIB_SUPPORTS_CLANG_TIDY   OFF)
    set(MYLIB_SUPPORTS_COVERAGE     OFF)
    set(MYLIB_SUPPORTS_UBSAN        ON)

elseif (MYLIB_COMPILER_MSVC)
    set(MYLIB_SUPPORTS_ASAN         ON)
    set(MYLIB_SUPPORTS_CLANG_TIDY   OFF)
    set(MYLIB_SUPPORTS_COVERAGE     OFF)
    set(MYLIB_SUPPORTS_UBSAN        OFF)

endif()

include(CheckIPOSupported)
check_ipo_supported(RESULT result OUTPUT output)
if (result)
    set(MYLIB_SUPPORTS_IPO ON)
else()
    set(MYLIB_SUPPORTS_IPO OFF)
endif()
unset(result)
unset(output)


message(TRACE "MYLIB supported options:")
message(TRACE "  MYLIB_SUPPORTS_ASAN                      ${MYLIB_SUPPORTS_ASAN}")
message(TRACE "  MYLIB_SUPPORTS_CLANG_TIDY                ${MYLIB_SUPPORTS_CLANG_TIDY}")
message(TRACE "  MYLIB_SUPPORTS_COVERAGE                  ${MYLIB_SUPPORTS_COVERAGE}")
message(TRACE "  MYLIB_SUPPORTS_IPO                       ${MYLIB_SUPPORTS_IPO}")
message(TRACE "  MYLIB_SUPPORTS_UBSAN                     ${MYLIB_SUPPORTS_UBSAN}")


##  Option defaults

set(MYLIB_BUILD_APPS_DEFAULT                    OFF)
set(MYLIB_BUILD_DOCS_DEFAULT                    OFF)
set(MYLIB_BUILD_EXAMPLES_DEFAULT                OFF)
set(MYLIB_BUILD_TESTS_DEFAULT                   OFF)
set(MYLIB_ENABLE_ASAN_DEFAULT                   OFF)
set(MYLIB_ENABLE_ASSERTS_DEFAULT                $<IF:$<BOOL:${MYLIB_BUILD_DEBUG}>,ON,OFF>)
set(MYLIB_ENABLE_CLANG_TIDY_DEFAULT             OFF)
set(MYLIB_ENABLE_COVERAGE_DEFAULT               OFF)
set(MYLIB_ENABLE_INSTALL_DEFAULT                ${PROJECT_IS_TOP_LEVEL})
set(MYLIB_ENABLE_IPO_DEFAULT                    ${MYLIB_SUPPORTS_IPO})
set(MYLIB_ENABLE_UBSAN_DEFAULT                  OFF)
set(MYLIB_ENABLE_WARNINGS_AS_ERRORS_DEFAULT     ${PROJECT_IS_TOP_LEVEL})


message(TRACE "MYLIB option defaults:")
message(TRACE "  MYLIB_BUILD_APPS_DEFAULT                 ${MYLIB_BUILD_APPS_DEFAULT}")
message(TRACE "  MYLIB_BUILD_DOCS_DEFAULT                 ${MYLIB_BUILD_DOCS_DEFAULT}")
message(TRACE "  MYLIB_BUILD_EXAMPLES_DEFAULT             ${MYLIB_BUILD_EXAMPLES_DEFAULT}")
message(TRACE "  MYLIB_BUILD_TESTS_DEFAULT                ${MYLIB_BUILD_TESTS_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_ASAN_DEFAULT                ${MYLIB_ENABLE_ASAN_DEFAULT}")
if (MYLIB_BUILD_DEBUG)
    message(TRACE "  MYLIB_ENABLE_ASSERTS_DEFAULT             ON")
else()
    message(TRACE "  MYLIB_ENABLE_ASSERTS_DEFAULT             OFF")
endif()
message(TRACE "  MYLIB_ENABLE_CLANG_TIDY_DEFAULT          ${MYLIB_ENABLE_CLANG_TIDY_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_COVERAGE_DEFAULT            ${MYLIB_ENABLE_COVERAGE_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_INSTALL_DEFAULT             ${MYLIB_ENABLE_INSTALL_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_IPO_DEFAULT                 ${MYLIB_ENABLE_IPO_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_UBSAN_DEFAULT               ${MYLIB_ENABLE_UBSAN_DEFAULT}")
message(TRACE "  MYLIB_ENABLE_WARNINGS_AS_ERRORS_DEFAULT  ${MYLIB_ENABLE_WARNINGS_AS_ERRORS_DEFAULT}")


##  Read options

option(MYLIB_BUILD_APPS                   "Enable building apps"                  ${MYLIB_BUILD_APPS_DEFAULT})
option(MYLIB_BUILD_DOCS                   "Enable building docs"                  ${MYLIB_BUILD_DOCS_DEFAULT})
option(MYLIB_BUILD_EXAMPLES               "Enable building examples"              ${MYLIB_BUILD_EXAMPLES_DEFAULT})
option(MYLIB_BUILD_TESTS                  "Enable building tests"                 ${MYLIB_BUILD_TESTS_DEFAULT})
option(MYLIB_ENABLE_ASAN                  "Enable address sanitizer"              ${MYLIB_ENABLE_ASAN_DEFAULT})
option(MYLIB_ENABLE_ASSERTS               "Enable debug asserts"                  ${MYLIB_ENABLE_ASSERTS_DEFAULT})
option(MYLIB_ENABLE_CLANG_TIDY            "Enable clang-tidy"                     ${MYLIB_ENABLE_CLANG_TIDY_DEFAULT})
option(MYLIB_ENABLE_COVERAGE              "Enable test coverage reporting"        ${MYLIB_ENABLE_COVERAGE_DEFAULT})
option(MYLIB_ENABLE_INSTALL               "Generate target for installing mylib"  ${MYLIB_ENABLE_INSTALL_DEFAULT})
option(MYLIB_ENABLE_IPO                   "Enable IPO/LTO"                        ${MYLIB_ENABLE_IPO_DEFAULT})
option(MYLIB_ENABLE_UBSAN                 "Enable undefined behaviour sanitizer"  ${MYLIB_ENABLE_UBSAN_DEFAULT})
option(MYLIB_ENABLE_VCPKG                 "Obtain dependencies via vcpkg"         ${MYLIB_ENABLE_VCPKG})
option(MYLIB_ENABLE_WARNINGS_AS_ERRORS    "Enable warnings-as-errors"             ${MYLIB_ENABLE_WARNINGS_AS_ERRORS_DEFAULT})


message(STATUS "MYLIB option:")
message(STATUS "  MYLIB_BUILD_DOCS                        ${MYLIB_BUILD_DOCS}")
message(STATUS "  MYLIB_BUILD_APPS                        ${MYLIB_BUILD_APPS}")
message(STATUS "  MYLIB_BUILD_EXAMPLES                    ${MYLIB_BUILD_EXAMPLES}")
message(STATUS "  MYLIB_BUILD_TESTS                       ${MYLIB_BUILD_TESTS}")
message(STATUS "  MYLIB_ENABLE_ASAN                       ${MYLIB_ENABLE_ASAN}")
message(STATUS "  MYLIB_ENABLE_ASSERTS                    ${MYLIB_ENABLE_ASSERTS}")
message(STATUS "  MYLIB_ENABLE_CLANG_TIDY                 ${MYLIB_ENABLE_CLANG_TIDY}")
message(STATUS "  MYLIB_ENABLE_COVERAGE                   ${MYLIB_ENABLE_COVERAGE}")
message(STATUS "  MYLIB_ENABLE_INSTALL                    ${MYLIB_ENABLE_INSTALL}")
message(STATUS "  MYLIB_ENABLE_IPO                        ${MYLIB_ENABLE_IPO}")
message(STATUS "  MYLIB_ENABLE_UBSAN                      ${MYLIB_ENABLE_UBSAN}")
message(STATUS "  MYLIB_ENABLE_VCPKG                      ${MYLIB_ENABLE_VCPKG}")
message(STATUS "  MYLIB_ENABLE_WARNINGS_AS_ERRORS         ${MYLIB_ENABLE_WARNINGS_AS_ERRORS}")


## Check supported options

if (MYLIB_ENABLE_ASAN AND NOT MYLIB_SUPPORTS_ASAN)
    message(FATAL_ERROR "Address sanitizer is not supported by the current compiler")
endif()

if (MYLIB_ENABLE_CLANG_TIDY AND NOT MYLIB_SUPPORTS_CLANG_TIDY)
    message(FATAL_ERROR "clang-tidy is not supported by the current compiler")
endif()

if (MYLIB_ENABLE_COVERAGE AND NOT MYLIB_SUPPORTS_COVERAGE)
    message(FATAL_ERROR "Test coverage is not supported by the current compiler")
endif()

if (MYLIB_ENABLE_IPO AND NOT MYLIB_SUPPORTS_IPO)
    message(FATAL_ERROR "Interprocess optimization is not supported by the current compiler")
endif()

if (MYLIB_ENABLE_UBSAN AND NOT MYLIB_SUPPORTS_UBSAN)
    message(FATAL_ERROR "Undefined behavior sanatizer is not supported by the current compiler")
endif()
