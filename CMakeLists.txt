cmake_minimum_required(VERSION 3.22)
project(asm)

include_directories(/opt/homebrew/include)

set(CMAKE_CXX_STANDARD 17)

add_executable(asm
        n64/my_property_map.cpp)

add_executable(asm2 n64/graph_coloring.cpp)
