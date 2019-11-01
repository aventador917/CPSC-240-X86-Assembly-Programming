
global Control
extern printf
extern scanf
extern getchar
extern Fill
extern Display
extern Sum

align 64

segment .data
Introduction db 'Welcome to the array tool',10,0
begining db 'The X86 subprogram is now executing.',10,0
askUserInput db ' Are you ready? Press c to continue or x to exit',10,0
PleaseInput db 'Please input your number: ',10,0
DisplayInput db '	Now dispalying your numbers: ',10,0
questionDisplay db ' Are these values correct? y or n' ,10,0

stringformat db '%s',0
integerformat db '%ld',0
sumMessage db 'The sum of array is %ld' ,10,0

segment .bss
myarray resq 26

segment .text
Control:
push       rbp                                              ;Save a copy of the stack base pointer
mov        rbp, rsp                                         ;We do this in order to be 100% compatible with C and C++.
push       rbx                                              ;Back up rbx
push       rcx                                              ;Back up rcx
push       rdx                                              ;Back up rdx
push       rsi                                              ;Back up rsi
push       rdi                                              ;Back up rdi
push       r8                                               ;Back up r8
push       r9                                               ;Back up r9
push       r10                                              ;Back up r10
push       r11                                              ;Back up r11
push       r12                                              ;Back up r12
push       r13                                              ;Back up r13
push       r14                                              ;Back up r14

;Welcome messsage
mov rax,0
mov rdi,stringformat
mov rsi,Introduction
call printf


;begining message
mov rax,0
mov rdi,stringformat
mov rsi,begining
call printf

;message for asking user to input their numbers
mov rax,0
mov rdi,stringformat
mov rsi,askUserInput ;Are you ready, press c to continue and input number, x to exit
call printf

;continue or exit loop
mov rax,0
call getchar
cmp rax,99 ;if user ready then c
jne ExitLoop ;if n then exit the program
jmp FillLoop


ExitLoop:
 mov eax, 60  
 xor edi, edi 
 syscall  

;the loop atfer user press c
;And call function Fill
FillLoop:

;please enter your number
mov rax,0
mov rdi,stringformat
mov rsi,PleaseInput
call printf

;calling Fill function
mov rax,0
mov rdi,myarray ;the name of array
mov rsi,26 ;the size of the array
call Fill ;call the function



;after inputing the numbers
;check the number by calling Displya function to show numbers
;And ask user are they correct y or n if not press n to call Fill function again
DisplayLoop:

;display message
mov rax,0
mov rdi,stringformat
mov rsi,DisplayInput
call printf


push qword 0
mov qword rax,0
mov rdi,myarray
mov rsi,26
call Display

;Are these values correct are not , yor n
;If not then jump back to Fill function

mov rax,0
mov rdi,stringformat
mov rsi,questionDisplay ;y or n
call printf

mov rax,0
call getchar
cmp rax,121 ;if correct then y 
jne FillLoop ;if n then jump to fill module again
jmp SumLoop ;if y then sum all the numbers by calling Sum function
					
SumLoop:
push qword 0
mov qword rax,0
mov rdi,myarray
mov rsi,26
call Sum


mov r15,rax
mov rax,0
mov rdi,sumMessage
mov rsi,r15
call printf

mov rax,r15

pop        r15                                              ;Restore r15
pop        r14                                              ;Restore r14
pop        r13                                              ;Restore r13
pop        r12                                              ;Restore r12
pop        r11                                              ;Restore r11
pop        r10                                              ;Restore r10
pop        r9                                               ;Restore r9
pop        r8                                               ;Restore r8
pop        rdi                                              ;Restore rdi
pop        rsi                                              ;Restore rsi
pop        rdx                                              ;Restore rdx
pop        rcx                                              ;Restore rcx
pop        rbx                                              ;Restore rbx
mov rsp,rbp
pop        rbp                                              ;Restore rbp

ret





