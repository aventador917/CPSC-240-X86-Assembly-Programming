#!/bin/bash


#author name:fanghua gu
#course id:cpsc 240
#The assignment number:Assignment 3
#Program name: Demonstrate Numeric IO


rm *.o, *.lis, *.out

echo "Assemble the X86 file StatisticalNum.asm"
nasm -f elf64 -l StatisticalNum.lis -o StatisticalNum.o StatisticalNum.asm

echo "Compile the C++ file control-d-main.cpp"
g++ -c -m64 -Wall -std=c++14 -o stats.o -fno-pie -no-pie stats.cpp

echo "Link the 'O' files control-d-main.o, control-d.o"
g++ -m64 -std=c++14 -fno-pie -no-pie -o main.out stats.o StatisticalNum.o

echo "Run the Control-d program"
./main.out
