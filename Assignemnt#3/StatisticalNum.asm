
global StatisticalNum
extern printf
extern scanf
extern getchar
align 64

segment .data
	begining db 'We will compute the mean for you using only integers.',10,0
	entermsg db 'Enter a sequence of long integers seperated by white space ',0
	response db 'The count of numbers entered was %ld',10,0
	blankMessage db '',10,0
	meanMessage db 'The integer mean was %ld' ,10,0
	InputMore db 'Do you have more sets of integers to process (y or n)? ',0
	GoodBye db 'fanghua gu hope you like your means. Please come again,',10 ,0
	ReturnMessage db 'This software will return the last mean to the driver program. Bye',10,0
	integerformat db "%ld",0
	stringformat db '%s',0
	


segment .bss

segment .text
StatisticalNum:
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
push       r15                                              ;Back up r15
beginLoop:
mov r15,0 ;initializinng the counter to 0
mov r14,0 ;sum of the entered numbers

;begining message
mov rax,0
mov rdi,stringformat
mov rsi,begining
call printf

;ask user to input numbers
mov rax,0
mov rdi,stringformat
mov rsi,entermsg
call printf

scanfloop:
push qword 0
mov qword rax,0
mov rdi,integerformat ;%ld
mov rsi,rsp
call scanf

cdqe ;sign extend the integer

;compare rax with -1
;if rax==1 then exit from the loop
cmp rax, -1
je finishLoop
pop rax

movsd xmm15, [rsp]
add r14,rax
inc r15 ;increase 1 to the loop counter
jmp scanfloop

finishLoop:
mov rax,0
mov rdi,stringformat
mov rsi,blankMessage
call printf
pop rax ;clear memory
push qword 0
;output of number
mov rax,1
mov rdi,response; the number of numbers you entered was %ld
mov rsi,r15 ;copy the number of r15 to rsi
call printf
pop rax

mov rax, qword r14
cqo
idiv qword r15
mov r14,rax

push qword 0
;output of mean
mov rax,1
mov rdi,meanMessage
mov rsi,r14
call printf
pop rax


mov rax,0
mov rdi,stringformat
mov rsi,InputMore ;Do you want to input more number
call printf

push qword 0
mov rax,0
mov rdi,stringformat ;Y/N
mov rsi,rsp
call scanf
pop r13

cmp r13,"y"
je beginLoop


;farewell message
mov rax,0
mov rsi,stringformat
mov rdi,GoodBye
call printf

mov rax,r14
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

