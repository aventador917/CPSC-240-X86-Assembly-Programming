#!/bin/bash

rm *.o
rm *.out

#echo "This is program <Passing Array>"

#echo "Assemble the module Control.asm"
nasm -f elf64 -l Control.lis -o Control.o Control.asm

#echo "Assemble the module Sum.asm"
nasm -f elf64 -l Sum.lis -o Sum.o Sum.asm

#echo "Compile the C++ module array_main.cpp"
g++ -c -m64 -Wall -o array_main.o array_main.cpp -fno-pie -no-pie -std=c++14

#echo "Compile the C++ module Display.cpp"
gcc -c -m64 -Wall -o Display.o Display.c -fno-pie -no-pie -std=c11

#echo "Compile the C++ module Fill.cpp"
g++ -c -m64 -Wall -o Fill.o Fill.cpp -fno-pie -no-pie -std=c++14

#echo "Link all object files already created"
g++ -m64 -o array_main.out array_main.o Display.o Fill.o Control.o Sum.o -fno-pie -no-pie -std=c++14

#echo "The bash script file is now closing."
./array_main.out
