section .data
	msg db "fact is:%d",10,0
section .text
	global fact
	extern printf
	 
fact:
	xor edx ,edx
	mov eax,1
	mov ecx,ebx
lp:	mul ecx
	dec ecx
	cmp ecx,0
	jne lp
	
	push eax
	push msg
	call printf
	add esp,8
	ret
