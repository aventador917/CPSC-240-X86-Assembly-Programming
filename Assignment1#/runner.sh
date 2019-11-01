#!/bin/bash


#Author: Paul TAng
#Program name: "Show System Memory at Any Location


gcc -c -Wall -m64 -std=c11 -fPIC -o driver.o driver.c -fno-pie -no-pie

nasm -f elf64 -o assignment1.o -l assignment1.lis assignment1.asm

gcc -m64 -o assignment1.out driver.o assignment1.o -fno-pie -no-pie -std=c11

./assignment1.out
