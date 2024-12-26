cmake_minimum_required(VERSION 3.20)

project(mdspan_cpm_example)

file(
   DOWNLOAD
   https://github.com/cpm-cmake/CPM.cmake/releases/download/v0.40.4/CPM.cmake
   ${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake
   EXPECTED_HASH SHA256=67dcc1deb6e12a2f0705647ccc5f7023e3d15746b944e14352b82373e09b8a0a
)
include(${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake)

cpmaddpackage(NAME mdspan
                GIT_TAG mdspan-0.6.0
                OPTIONS "MDSPAN_ENABLE_TESTS ON" "CMAKE_CXX_EXTENSIONS OFF"
                GIT_REPOSITORY "https://github.com/kokkos/mdspan")


add_executable(main ${CMAKE_SOURCE_DIR}/main.cpp)
target_link_libraries(
    main mdspan
)