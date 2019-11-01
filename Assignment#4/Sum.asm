;author name:fanghua gu
;course id:cpsc 240
;The assignment number:Assignment 4

global Sum
extern printf
extern scanf
extern getchar
align 64

segment .data
integerformat db'%ld',0
sumMessage db 'The integer mean was %ld' ,10,0

segment .bss


segment .text

Sum:
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

mov rdx, 0  ; index of array
mov rax, 0  ; sum of array

loop:
    cmp rdx, rsi
    je endloop

    add rax, qword[rdi + rdx*8]
    inc rdx
    jmp loop

endloop:
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
pop rbp
ret 





