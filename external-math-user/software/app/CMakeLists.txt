

add_executable(app main.cpp)


set(MathLib_DIR "../../../math-lib/export/bin/cmake")
find_package(MathLib)

target_link_libraries(
  app
  PUBLIC
  MathLib::MathLib
)

target_include_directories(app
                           PRIVATE
                           ${CMAKE_CURRENT_SOURCE_DIR}
)
