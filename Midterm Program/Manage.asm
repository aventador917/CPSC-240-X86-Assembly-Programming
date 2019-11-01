
 global Manage
extern printf
extern scanf
extern  Getdata
extern  Showarray
extern  Reverse

segment .data
scanFormat                   db         "%d", 0
stringFormat                 db         "%s", 0
welcomeMessage       db        "Welcome to Array Management Tool.", 10, 0
showMessage                     db          "Thank tou. The array contains the following data:",10,0
reverseArray                 db           "The data have been reversed. This is the array:",10,0
boolMessage                db             "Is this correct(y or n)? ", 0

segment .bss
array    resq       100

segment .text
       
Manage:
push       rbp                                              ;Save a copy of the stack base pointer
mov        rbp, rsp                                         ;We do this in order to be 100% 
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
push       r15


mov rax, 0
mov rdi, welcomeMessage
call printf

push qword 0
mov qword rax,0
mov rdi, array
mov rsi, 100
call Getdata

mov r14, rax

mov rax, 0
mov rdi, showMessage
call printf

push qword 0
mov qword rax, 0
mov rdi, array
mov rsi, r14
call Showarray

mov rax,0
mov rdi, boolMessage
call printf


push qword 0 
mov rax, 0
mov rdi, stringFormat
mov rsi, rsp
call scanf
pop r15

cmp r15, "y"
je countinue
exit:
mov eax, 60  
xor edi, edi 
syscall  

countinue:



mov rax,0
mov rdi, reverseArray
call printf

push qword 0
mov qword rax, 0
mov rdi, array
mov rsi, r14
call Reverse


mov rax, 0
mov rdi, array
mov rsi, r14
call Showarray

mov rax, r14

pop        r15                                              ;Restore r15
pop        r14                                              ;Restore r14
pop        r13                                              ;Restore r13
pop        r12                                              ;Restore r12
pop        r11                                              ;Restore r11
pop        r10                                              ;Restore r10
pop        r9                                               ;Restore r9
pop        r8                   ;Restore r8
pop        rdi                                              ;Restore rdi
pop        rsi                                              ;Restore rsi
pop        rdx                                              ;Restore rdx
pop        rcx                                              ;Restore rcx
pop        rbx                                              ;Restore rbx
mov rsp,rbp
pop rbp


ret 
