

add_library(MathLib STATIC mathlib/mymath.h mathlib/mymath.cpp)

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

install(FILES mathlib/mymath.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/mathlib)

install(EXPORT MathLibTargets
        FILE MathLibConfig.cmake
        NAMESPACE MathLib::
        DESTINATION ${CMAKE_INSTALL_BINDIR}/cmake
)
