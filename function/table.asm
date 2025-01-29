section .data
	msg db "table is:%d",10,0
section .text
	global table
	extern printf
table:
	xor edx,edx
	mov eax,4
	mov ecx,ebx
lp:
	mul ebx
	inc ecx
	cmp ecx,11
	jne lp

	push eax
	push msg
	call printf
	add esp,8
	ret
