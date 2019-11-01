extern printf, scanf

section .data
    input_format        db  "%ld", 0

    begin_prompt        db  "The X86 program has begun", 10, 0
    num1_prompt         db  "Please enter the first integer and press enter: ", 0
    num2_prompt         db  "Please enter the second integer and press enter: ", 0
    thanks_prompt       db  "Thank you", 10, 0
    error_prompt        db  "Sorry: we do not handle zero here at Ubuntu dot com.", 10, "Please run this program again.", 10, "Negative 1 will be returned to the caller program.  Have a nice day.", 10, 0
    result_prompt       db  "The quotient of %ld divided by %ld is %ld with remainder equal to %ld", 10, 0
    positive_prompt     db  "The remainder is clearly positive.", 10, 0
    negative_prompt     db  "The remainder is negative.", 10, 0
    end_prompt          db  "The remainder will be returned to the caller program.  Have a nice day.", 10, 0


section .text
global assignment2
assignment2:

push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15

    mov rdi, begin_prompt
    mov rax, 0
    call printf

    mov rdi, num1_prompt
    mov rax, 0
    call printf

    push qword 0
    mov rdi, input_format
    mov rsi, rsp
    mov rax, 0
    call scanf
    pop r15

    
    mov rdi, num2_prompt
    mov rax, 0
    call printf
    
    push qword 0
    mov rdi, input_format
    mov rax, 0
    mov rsi, rsp
    call scanf
    pop r14

    cmp r14, 0
    jne acceptableDivider

    mov rdi, error_prompt
    mov rax, 0
    call printf

    mov rax, -1
    
    pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp
    ret

acceptableDivider:
    mov rdi, thanks_prompt
    mov rax, 0
    call printf

    mov rax, r15
    cqo
    idiv r14

    mov r8, rdx
    mov rcx, rax
    mov rdx, r14
    mov rsi, r15
    mov rdi, result_prompt
    mov rax, 0
    push r8
    call printf

    pop r8
    cmp r8, 0
    push r8
    jl negReminder
    mov rdi, positive_prompt
    mov rax, 0
    call printf

    jmp done

negReminder:
    mov rdi, negative_prompt
    mov rax, 0
    call printf

done:
    mov rdi, end_prompt
    mov rax, 0
    call printf

    pop r8
    mov rax, r8

    pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp
    ret                        ; Return control
