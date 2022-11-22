project(app)

add_executable(code-cmake-vcpkg main.cpp)
target_precompile_headers(code-cmake-vcpkg PUBLIC pch.h)
target_link_libraries(code-cmake-vcpkg PRIVATE
    GTest::gtest 
    GTest::gtest_main
    cxxopts::cxxopts
    fmt::fmt-header-only
    rapidjson
)
