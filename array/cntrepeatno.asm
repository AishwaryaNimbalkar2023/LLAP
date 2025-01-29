section .data
	arr dd 12,34,12,45,12,56,-1
	msg db "number repeated count:%d",10,0
section .text
	global main
	extern printf
main:
	xor ecx,ecx
	mov eax,arr
lp:	cmp dword[eax],-1
	je out
	cmp dword[eax],12
	je count
	jmp goto

count:
	inc ecx
goto:
	add eax,4
	jmp lp

out:
	push ecx
	push msg
	call printf
	add esp,8
	ret
