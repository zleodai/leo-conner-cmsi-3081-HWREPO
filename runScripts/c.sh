#!/bin/bash

# For Windows
gcc ../c/string_stack_test.c ../c/string_stack.c -o "a.exe"
./a.exe

rm a.exe

# For WSL
# gcc ../c/string_stack_test.c ../c/string_stack.c -o "a.out"
# valgrind --leak-check=yes ./a.out

# rm a.out