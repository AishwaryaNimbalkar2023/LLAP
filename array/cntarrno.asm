section .data
	arr dd 10,23,41,56,12,-1
	msg db "value is%d",10,0
section .text
	global main
	extern printf
main:
	mov esi,arr
	mov ecx,0
lp: 	cmp dword[esi],-1
	jz endl
	inc ecx
	add esi,4
	jmp lp

endl:
	pusha
	push ecx
	push msg
	call printf
	add esp,8
	popa
	ret
	
