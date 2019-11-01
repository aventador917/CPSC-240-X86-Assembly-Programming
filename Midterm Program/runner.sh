#!/bin/bash


#echo "Assemble the X86 file Manage.asm"
nasm -f elf64 -l Manage.lis -o Manage.o Manage.asm

#echo "Assemble the X86 file Reverse.asm"
nasm -f elf64 -l Reverse.lis -o Reverse.o Reverse.asm

#echo "Compile the C++ file Main.cpp"
g++ -c -m64 -Wall -o Main.o Main.cpp -fno-pie -no-pie -std=c++14

#echo "Compile the C++ file Getdata.cpp"
g++ -c -m64 -Wall -o Getdata.o Getdata.cpp -fno-pie -no-pie -std=c++14
#echo "Compile the C++ file Showarray.cpp"
g++ -c -m64 -Wall -o Showarray.o Showarray.cpp -fno-pie -no-pie -std=c++14

#echo " Link all files "
g++ -m64 -o Main.out Main.o Showarray.o Getdata.o Manage.o Reverse.o -fno-pie -no-pie -std=c++14

#echo "Run the program Floating Point Input Output"
./Main.out
