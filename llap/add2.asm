section .data
	msg1 dd "%d",0
	msg db "addition of two number:%d",10,0
section .bss
	a resd 1
	b resd 1
	result resd 1
section .text
	global main
	extern printf,scanf
main:
	push a
	push msg1
	call scanf
	add esp,8
	
	push b
	push msg1
	call scanf
	add esp,8
	
	mov eax,dword[a]
	mov ebx,dword[b]
	add eax,ebx
	push eax
	push msg
	call printf
	add esp,8
	ret
