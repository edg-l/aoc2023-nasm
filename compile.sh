#!/bin/bash

# nasm -felf64 "$1".asm && gcc -no-pie "$1".o && ./a.out

nasm -felf64 -gdwarf program.asm && ld program.o -o program
