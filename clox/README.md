# CLox

Lox bytecode interpreter written in C.

## How to execute

1. You will need:
- cmake
- ninja
- clang
  
2. Generate build files:

```bash
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_MAKE_PROGRAM=ninja -G Ninja -B ./build
```

3. Build executable

```bash
cd build
ninja
```

3. Run project

```bash
./clox
```
