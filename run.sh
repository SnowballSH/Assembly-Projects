#!/bin/bash
nasm -felf64 -o x.o $1 && ld x.o && ./a.out && rm ./a.out && rm ./x.o