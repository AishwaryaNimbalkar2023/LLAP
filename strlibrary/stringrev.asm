
section .bss
	dest resb 1000
section .text	
	global reverse
	extern puts,length,reverse,printf
reverse:
	enter 0,0
	mov ecx,dword[ebp+8]
	push ecx
	call length
	add esp,4

	mov esi,dword[ebp+8]
	mov ebx,ecx
	mov edi,dest

	dec ebx
	add esi,ebx
	dec esi
lp1:
	mov al,byte[esi]
	mov byte[edi],al
	dec esi
	inc edi
	dec ebx
	cmp ebx,0
	je exit
	jmp lp1
	
exit:	pusha
	push dest
	call puts
	add esp,4
	popa
	leave
	ret
