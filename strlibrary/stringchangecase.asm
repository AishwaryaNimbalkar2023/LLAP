section .data
	msg db "string after changecase:",0
section .bss
	dest resd 1000
section .text
	global cngcase
	extern printf
cngcase:
	enter 0,0
	mov esi,dword[ebp+8]
	mov edi,dest
	push msg
	call printf
	add esp,8
lp:
	mov al,byte[esi]
	cmp al,10
	je exit
	cmp al,96
	jle goto
	sub al,32
	mov byte[edi],al
	jmp outer

goto:	cmp al,32
	je space
	add al,32
	mov byte[edi],al
	jmp outer
	
space:
	mov byte[edi],al
outer:
	inc esi
	inc edi
	jmp lp
exit:
	pusha
	push dest
	call printf
	add esp,4
	popa
	leave
	ret
	





