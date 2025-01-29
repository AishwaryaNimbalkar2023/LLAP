section .data
	a dd 5
	b dd 10
	msg db "addition of two number:%d",10,0
section .text
	global main
	extern printf
main:
	mov eax,dword[a]
	mov ebx,dword[b]
	add eax,ebx
	push eax
	push msg
	call printf
	add esp,8
	ret
	

