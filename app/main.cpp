#include "pch.h"

using namespace std;
using namespace rapidjson;

int addInt(int x, int y) { return x + y; }

#ifndef TEST_BUILD
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

    fmt::print("Hello {}. The answer is {}\n\n", "VSCode+CMake+VCPkg", 42);
    fmt::print("{}", options.help());

    return 0;
}
#else
#include "gtest/gtest.h" //https://google.github.io/googletest/

int main(int argc, char** argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

TEST(Main, AddIntOk) {
    ASSERT_EQ(addInt(40, 2), 42);
    ASSERT_EQ(addInt(3, 4), 7);
}

TEST(Main, AddIntBad) {
    ASSERT_EQ(addInt(40, 2), 43);
    ASSERT_EQ(addInt(3, 4), 8);
}
#endif
