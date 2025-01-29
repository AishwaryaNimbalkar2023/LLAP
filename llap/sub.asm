section .data
	a dd 10
	b dd 7
	msg db "sutraction of two number:%d",10,0
section .text
	global main
	extern printf
main:
	mov eax,dword[a]
	mov ebx,dword[b]
	sub eax,ebx
	push eax
	push msg
	call printf
	add esp,8
	ret
