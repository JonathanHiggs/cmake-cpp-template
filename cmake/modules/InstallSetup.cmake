## Configure the install location for the library
message(TRACE "mylib::InstallSetup")


if(MYLIB_ENABLE_INSTALL)
    if(NOT DEFINED MYLIB_INSTALL_DIR)
        if (DEFINED CMAKE_INSTALL_LIBDIR)
            set(_install_dir ${CMAKE_INSTALL_LIBDIR})
        elseif (DEFINED CMAKE_INSTALL_PREFIX)
            set(_install_dir ${CMAKE_INSTALL_PREFIX})
        else()
            set(_install_dir ${CMAKE_BINARY_DIR})
        endif()

        set(MYLIB_INSTALL_DIR ${_install_dir} CACHE STRING "Install path for ${PROJECT_NAME}")
        unset(_install_dir)
    endif()

    message(TRACE "CMAKE_INSTALL_LIBDIR:       ${CMAKE_INSTALL_LIBDIR}")
    message(TRACE "CMAKE_INSTALL_PREFIX:       ${CMAKE_INSTALL_PREFIX}")
    message(TRACE "MYLIB_ENABLE_INSTALL:       ${MYLIB_ENABLE_INSTALL}")
    message(STATUS "MYLIB_INSTALL_DIR:         ${MYLIB_INSTALL_DIR}")
endif()


if(MYLIB_ENABLE_INSTALL AND NOT CMAKE_SKIP_INSTALL_RULES)
    include(CMakePackageConfigHelpers)
    configure_package_config_file(
        "${CMAKE_SOURCE_DIR}/cmake/templates/mylib-config.cmake.in"
        "${CMAKE_BINARY_DIR}/mylib-config.cmake"
        INSTALL_DESTINATION ${MYLIB_INSTALL_DIR}
    )

    write_basic_package_version_file(
        "${CMAKE_BINARY_DIR}/mylib-config-version.cmake"
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY AnyNewerVersion
    )

    # include(GNUInstallDirs)
    #
    # message(STATUS "CMAKE_INSTALL_PREFIX:       ${CMAKE_INSTALL_PREFIX}")
    # message(STATUS "CMAKE_INSTALL_INCLUDEDIR:   ${CMAKE_INSTALL_INCLUDEDIR}")
    # message(STATUS "CMAKE_INSTALL_LIBDIR:       ${CMAKE_INSTALL_LIBDIR}")
    # message(STATUS "CMAKE_INSTALL_BINDIR:       ${CMAKE_INSTALL_BINDIR}")
    # message(STATUS "MYLIB_INSTALL_DIR:          ${MYLIB_INSTALL_DIR}")

    # install(
    #     TARGETS
    #         mylib_base_target
    #         mylib
    # )

    install(
        TARGETS
            mylib_base_target
            mylib
            mylib_other
        EXPORT mylib-targets
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        FILE_SET HEADERS
        INCLUDES DESTINATION include/mylib
    )

    install(
        EXPORT mylib-targets
        FILE mylib-targets.cmake
        NAMESPACE mylib::
        DESTINATION share/mylib
    )

    install(
        FILES
            "${CMAKE_BINARY_DIR}/mylib-config.cmake"
            "${CMAKE_BINARY_DIR}/mylib-config-version.cmake"
        DESTINATION share/mylib
    )

    # ToDo: pdb files

endif()