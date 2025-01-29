section .data 
	a dd 10
	b dd 20
	msg db "addition of two number:%d",10,0
section .text
	global main
	extern printf
main:
	mov eax ,dword[a]
	mov ebx,dword[b]
	add eax,ebx
	push eax
	push msg
	call printf
	add esp,8
	ret
