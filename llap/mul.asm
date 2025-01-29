section .data
	a dd 10
	b dd 5
	msg db"multiplication of two number:%d",10,0
section .text
	global main
	extern printf
main:
	mov eax,dword[a]
	mov ebx,dword[b]
	mul ebx
	push eax
	push msg
	call printf
	add esp,8
	ret
