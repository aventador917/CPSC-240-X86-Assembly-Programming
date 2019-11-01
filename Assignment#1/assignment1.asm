extern printf
extern scanf


section .data
	input_format		db "%d", 0
	
	start_prompt		db "This program was built by your name.", 10, 0
	input_prompt_1		db "Please enter the first integer: ", 0
	output_prompt_1		db "You entered: %d", 10, 0
	
	input_prompt_2		db "Please enter the second integer: ", 0
	output_prompt_2		db "You entered: %d", 10, 0
	sum_prompt		db "The sum of these two integers is: %d", 10, 0
	product_prompt		db "The product of these two integers is %d ", 10, 0
	end_prompt		db "The integer 5 will be returned to the calling program.", 10, 0

	
section .text
	global assignment1

assignment1:

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

	mov rdi, start_prompt
	mov rax, 0
	call printf

	mov rdi, input_prompt_1
	mov rax, 0
	call printf

	push qword 0
	mov rdi, input_format
	mov rsi, rsp
	mov rax, 0
	call scanf
	pop r15
	
	mov rdi, output_prompt_1
	mov rsi, r15
	mov rax, 0
	call printf
	
	mov rdi, input_prompt_2
	mov rax, 0
	call printf

	push qword 0
	mov rdi, input_format
	mov rsi, rsp
	mov rax, 0
	call scanf
	pop r14

	mov rdi, output_prompt_2
	mov rsi, r14
	mov rax, 0
	call printf

	mov rax, r15
	add rax, r14
	mov rdi, sum_prompt
	mov rsi, rax
	mov rax, 0
	call printf
	
	mov rax, r15
	imul r14
	mov rdi, product_prompt
	mov rsi, rax
	mov rax, 0
	call printf

	mov rax, 0
	mov rdi, end_prompt
	mov rsi, 0
	call printf

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
	mov rax, 5
	ret
	
		
	
