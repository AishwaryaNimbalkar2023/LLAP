section .data
	msg db "%d",10,0
section .text
	global main
	extern printf
main:

	mov ecx,1
lp:	mov eax,ecx
	cmp eax,11
	je exit
	mov ebx,5
	mul ebx
	pusha
	push eax
	push msg
	call printf
	add esp,8
	popa
	inc ecx
	jmp lp
exit: 	ret

