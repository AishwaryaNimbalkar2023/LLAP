section .data
	msg db "odd number upto 10 are:",10,0
	msg1 db "%d",10,0
section .text
	global main
	extern printf
main:
	push msg
	call printf
	add esp,4

	mov ecx,1
	xor edx,edx
lp:	mov eax,ecx
	cmp eax,10
	je exit
	mov ebx,2
	div ebx
	cmp edx,0
	jne lp2
	inc ecx
	jmp lp
lp2:
	pusha
	push ecx
	push msg1
	call printf
	add esp,8
	popa
	inc ecx
	jmp lp

exit:
	ret
