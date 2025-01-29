section .data
	msg db "%d",10,0
section .text
	global table
	extern printf
table:

	mov ecx,ebx
lp:	mov eax,4
	mul ecx
	pusha
	push eax
	push msg
	call printf
	add esp,8
	popa
	inc ecx
	cmp ecx,11
	jne lp

	ret
	
	
	
