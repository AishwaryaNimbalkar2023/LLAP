section .data
	a dd 10
	b dd 5
	msg db"division:%d",10,0
	msg1 db"remandar:%d",10,0
section .text
	global main
	extern printf
main:
	xor edx,edx
	mov eax,dword[a]
	mov ebx,dword[b]
	div ebx
	push eax
	push msg
	call printf
	add esp,8
	push edx
	push msg1
	call printf
	add esp,8
	ret

