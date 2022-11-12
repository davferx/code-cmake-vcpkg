project(app)

add_executable(code-cmake-vcpkg main.cpp)
target_precompile_headers(code-cmake-vcpkg PUBLIC pch.h)
target_link_libraries(code-cmake-vcpkg PRIVATE
    Catch2::Catch2 Catch2::Catch2WithMain
    cxxopts::cxxopts
    rapidjson
)

install(TARGETS code-cmake-vcpkg)
