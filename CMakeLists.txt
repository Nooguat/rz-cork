cmake_minimum_required(VERSION 3.0)
set(PKG_CONFIG_USE_CMAKE_PREFIX_PATH True)

project(rz-remap)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(Rizin REQUIRED Core)

set(RIZIN_INSTALL_PLUGDIR "${Rizin_PLUGINDIR}" CACHE STRING "Directory to install rizin plugins into")
set(GCC_COMPILE_FLAGS "-I /usr/include/librz -I /usr/include/librz/sdb")
add_definitions(${GCC_COMPILE_FLAGS})

if(CMAKE_VERSION VERSION_LESS "3.1")
    if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        add_definitions(-std=c++11)
    endif()
else()
    set(CMAKE_CXX_STANDARD 11)
endif()

set(PUBLIC_HEADERS rz-remap.h)


set(CORE_SOURCE
rz-remap.cpp
)

add_library(rz_remap SHARED ${CORE_SOURCE})
target_link_libraries(rz_remap pugixml)
target_link_libraries(rz_remap Rizin::Core)

set_target_properties(rz_remap PROPERTIES
        OUTPUT_NAME rz_remap
        PREFIX "")

configure_file(
    rz-remap.pc.in
    rz-remap.pc
    @ONLY)
if(NOT DEFINED CMAKE_INSTALL_LIBDIR)
	set(CMAKE_INSTALL_LIBDIR lib CACHE PATH "Output directory for libraries.")
endif()
install(FILES ${PUBLIC_HEADERS} DESTINATION "${CMAKE_INSTALL_PREFIX}/include")
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/rz-remap.pc" DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
install(TARGETS rz_remap DESTINATION "${RIZIN_INSTALL_PLUGDIR}")