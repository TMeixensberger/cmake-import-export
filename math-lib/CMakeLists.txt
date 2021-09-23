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
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}/${CMAKE_BUILD_TYPE}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/${CMAKE_BUILD_TYPE}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_BINDIR}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

message(lol${CMAKE_INSTALL_INCLUDEDIR})
message(lol${CMAKE_INSTALL_LIBDIR})
message(lol${CMAKE_INSTALL_BINDIR})
message(lol${CMAKE_BUILD_TYPE})

install(FILES math.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(EXPORT MathLibTargets
        FILE MathLibTargets.cmake
        NAMESPACE MathLib::
        DESTINATION ${CMAKE_INSTALL_BINDIR}/cmake
)
