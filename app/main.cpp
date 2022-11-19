#include "pch.h"

using namespace std;
using namespace rapidjson;

int addInt(int x, int y) { return x + y; }

#ifdef TEST_BUILD
// For test builds we hide the `main` function, include the Catch2 headers and test definitions.
namespace internal {
#endif
    int main() {
        Document d;
        d.Parse(R"({
            "project":  "rapidjson",
            "stars": 10
        })");

        cxxopts::Options options("code-cmake-vcpkg", "A demo program using CMake and VCPkg");

        options.add_options()                                                               //
            ("d,debug", "Enable debugging")                                                 //
            ("v,verbose", "Verbose output", cxxopts::value<bool>()->default_value("false")) //
            ("h,help", "Print usage");

        fmt::print("xHello {}. The answer is {}\n\n", "VSCode+CMake+VCPkg", 42);
        fmt::print("{}", options.help());

        return 0;
    }

#ifdef TEST_BUILD
}

#include <catch2/catch_test_macros.hpp>

TEST_CASE("addInt", "[basic]") {
    REQUIRE(addInt(3, 4) == 7); //xx
}
#endif