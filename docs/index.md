# Code CMake VCPkg

[![main](https://github.com/davferx/code-cmake-vcpkg/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/davferx/code-cmake-vcpkg/actions/workflows/main.yml)

An MVP repo to compile C++ and run the tests using CMake, Ninja, VCPkg & GitHub actions.

## CMake Docs
* https://cmake.org/cmake/help/latest/index.html

## Ninja Docs
* https://ninja-build.org/manual.html

## VCPkg Docs
* https://vcpkg.io/en/index.html

## GitHub Actions Docs
* https://docs.github.com/en/actions
* https://github.com/marketplace?type=actions
* https://github.com/orgs/actions/repositories?q=&type=all&language=&sort=name
* https://github.com/actions/runner-images/blob/main/images/win/Windows2022-Readme.md

## CMake Presets
```mermaid
classDiagram
    base <|-- windows_base
    windows_base <|-- x64_msvc_dbg
    windows_base <|-- x64_msvc_rel
    windows_base <|-- x64_msvc_dbg

    windows_base <|-- x86_msvc_rel
    windows_base <|-- x86_msvc_tst

    base <|-- mingw_base
    mingw_base <|-- x64_mclang_dbg
    mingw_base <|-- x64_mclang_rel
```
end of graph
