cmake_minimum_required (VERSION 3.23)

project (code-cmake-vcpkg)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${MY_CXX_FLAGS}")

find_package(catch2 REQUIRED)
find_package(cxxopts REQUIRED)
find_package(RapidJSON REQUIRED)

add_subdirectory(app)
