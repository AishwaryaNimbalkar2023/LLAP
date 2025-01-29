section .data
	msg1 db "given string is pallindrome",10,0
	msg2 db "given string is not pallindrome",10,0
section .text
	global pallindrome
	extern printf,length
pallindrome:
	enter 0,0
	mov ecx,dword[ebp+8]
	push ecx
	call length
	add esp,4

	mov esi,dword[ebp+8]
	mov edi,dword[ebp+8]
	
	
	dec ecx
	add edi,ecx
	dec edi
	
lp1:
	mov al,byte[esi]
	cmp al,0
	je goto
	cmp al,byte[edi]
	jne out
	inc esi
	dec edi
	jmp lp1

goto:
	push msg1
	call printf
	add esp,4
	jmp exit
out:
	push msg2
	call printf
	add esp,4
	
exit:
	leave
	ret

	
