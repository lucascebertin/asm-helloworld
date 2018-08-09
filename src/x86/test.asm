section .text
global _main
	_strlen:
	  push edi
	  sub ecx, ecx
	  mov edi, esp
	  not ecx
	  sub al, al
	  cld
	  repne scasb
	  not ecx
	  lea eax, [ecx-1]
	  pop edi
	  ret

	_print:
	  push 0x0
	  push edi

	  call _strlen
	  mov edx, eax

	  mov eax, 0x4
	  mov ebx, 0x1
	  mov ecx, esp
	  int 0x80

	  pop edi
	  pop edi

	  ret

	_exit
	  mov eax, 0x1
	  int 0x80
	  ret

	_main: 
	  mov edi, 0x44434241
	  call _print

	  mov edi, 0x0a474645
	  call _print

	  call _exit

