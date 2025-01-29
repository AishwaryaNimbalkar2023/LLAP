section .data
	a dd 3
	msg db "it is prime number",10,0
	msg1 db "it is not prime number",10,0
section .text
	global main
	extern printf
main:
	mov eax,dword[a]
	mov ebx,1
	mov ecx,0
	xor edx,edx
lp:
	cmp ebx,eax
	je lp4
	div ebx
	cmp edx,0
	je lp3
	inc ebx
	jmp lp
lp3:
	inc ecx
	inc ebx
	jmp lp
lp4:
	cmp ecx,1
	je lp5
	push msg1
	call printf
	add esp,4
	jmp exit
lp5:
	push msg
	call printf
	add esp,4
exit:
	ret
