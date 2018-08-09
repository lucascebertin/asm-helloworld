section .text
global _main
	_strlen:
	  push rdi
	  sub rcx, rcx
	  mov rdi, rsp
	  not rcx
	  sub al, al
	  cld
	  repne scasb
	  not rcx
	  pop rdi
	  lea rax, [rcx-1]
	  ret

	_print:
	  push rbp
	  mov rbp, rsp

	  call _strlen
	  
	  mov rdx, rax
	  mov rax, rdi

	  push rax
	  mov rax, 0x1
	  mov rdi, 0x1
	  mov rsi, rsp
	  syscall
	  pop rbp
	  pop rbp
	  ret

	_exit
	  push rbp
	  mov rbp, rsp
	  mov rax, 0x3c
	  syscall
	  pop rbp
	  ret

	_main: 
	  push rbp
	  mov rbp, rsp

          call _test

	  mov rdi, 0x0a41424344
	  call _print

	  mov rdi, "1"
	  call _print

  	  sub rax, rax
          mov rdx, 0x31
	  mov rcx, 0x1
	  add rdx, rcx
	  mov rax, rbx
	  
	  mov rdi, rax
	  call _print

	  call _exit

        _test:
	  push rbp
	  mov rbp, rsp
	
	  push rdi
	  push rsi
	  push rdx

	  push rbx
	  push r12
	  push r13
	  push r14
	  push r15

          mov rdx, 0x1
	  mov rcx, 0x2
	  add rdx, rcx
	  mov rax, rbx

	  pop r15
	  pop r14
	  pop r13
	  pop r12
	  pop rbx

	  mov rsp, rbp
	  pop rbp
	  ret

