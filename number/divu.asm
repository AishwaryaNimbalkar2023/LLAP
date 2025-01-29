section .data
	msg db "enter a number:",10,0
	no dd "%d",0
	msg2 db "quotient is:%d",10,0
	msg3 db "reminder is:%d",10,0
	
section .bss
	a resd 1
	b resd 1
	quo resd  1
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	push a
	push no
	call scanf
	add esp,8

	push b
	push no
	call scanf
	add esp,8

	xor edx,edx
	mov eax,dword[a]
	mov ecx,dword[b]
	div ecx

	push eax
	push msg2
	call printf
	add esp,8

	push edx
	push msg3
	call printf
	add esp,8
	ret
