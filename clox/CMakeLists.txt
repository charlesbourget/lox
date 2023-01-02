cmake_minimum_required(VERSION 3.24)
project(clox C)

set(CMAKE_C_STANDARD 23)

add_executable(clox main.c common.h chunk.h)
