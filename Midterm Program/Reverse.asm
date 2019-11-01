
extern printf

segment .data
;empty
segment .bss
 ;empty
segment .text
    global Reverse
Reverse:
push       rbp                                              
mov        rbp, rsp                                        
push       rbx                                            
push       rcx                                            
push       rdx                                           
push       rsi                                           
push       rdi
push       r8                                             
push       r9                                               
push       r10                                            
push       r11                                      
push       r12                                            
push       r13                                              
push       r14  
push       r15

mov r14, rdi
mov r13, rsi    

cmp r13, 0
je endLoop
dec r13
mov r12, 0



reverseLoop:

mov r15d, [r14 + 4*r13]
mov ebx, [r14 + 4*r12]
mov [r14 + 4*r13], ebx
mov [r14 + 4*r12], r15d

inc r12
dec r13

cmp r12,r13
jl reverseLoop

endLoop:
pop        r15
pop        r14                                              
pop        r13                                              
pop        r12                                              
pop        r11                                              
pop        r10                                           
pop        r9                                               
pop        r8                                            
pop        rdi                                            
pop        rsi                                              
pop        rdx                                            
pop        rcx                                             
pop        rbx                                              
mov rsp, rbp
pop rbp

ret 



