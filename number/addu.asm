section .data
	msg db "enter two number:",10,0
	no dd "%d",0
	msg2 db "addition of two number:%d",10,0
section .bss
	a resd 1
	b resd 1
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

	mov eax,dword[a]
	mov ebx,dword[b]
	add eax,ebx
	push eax
	push msg2
	call printf
	add esp,8
	ret
