section .data
	msg db"%d",0
	msg1 db"sutraction of two number:%d",10,0
section .bss
	a resd 1
	b resd 1
section .text
	global main
	extern printf,scanf
main:
	push a
	push msg
	call scanf
	add esp,8
	push b
	push msg
	call scanf
	add esp,8

	mov eax,dword[a]
	mov ebx,dword[b]
	sub eax,ebx
	push eax
	push msg1
	call printf
	add esp,8
	ret
	
