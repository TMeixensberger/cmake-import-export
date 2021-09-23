cmake_minimum_required(VERSION 3.15)
project(Math)

include(GNUInstallDirs)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Set output dir
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_library(MathLib STATIC math.h math.cpp)

target_include_directories(MathLib
                           PUBLIC
                           "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>"
                           "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)

install(TARGETS MathLib
        EXPORT MathLibTargets
        RUNTIME DESTINATION "bin/${CMAKE_BUILD_TYPE}"
        LIBRARY DESTINATION "bin/${CMAKE_BUILD_TYPE}"
        ARCHIVE DESTINATION "bin/${CMAKE_BUILD_TYPE}"
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
	install(FILES $<TARGET_PDB_FILE:MathLib> DESTINATION "bin/${CMAKE_BUILD_TYPE}" OPTIONAL)
endif()
#message(lol${CMAKE_INSTALL_INCLUDEDIR})
#message(lol${CMAKE_INSTALL_LIBDIR})
#message(lol${CMAKE_INSTALL_BINDIR})
#message(lol${CMAKE_BUILD_TYPE})
message(lol${COMPILE_PDB_NAME})

install(FILES math.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(EXPORT MathLibTargets
        FILE MathLibTargets.cmake
        NAMESPACE MathLib::
        DESTINATION ${CMAKE_INSTALL_BINDIR}/cmake
)
