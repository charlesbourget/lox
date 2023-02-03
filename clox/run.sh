#!/bin/bash

set -e

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_MAKE_PROGRAM=ninja -G Ninja -B ./build
cd build/
ninja

./clox