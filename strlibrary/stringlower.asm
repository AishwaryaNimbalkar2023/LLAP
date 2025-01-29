section .data
	msg1 db "  ",10,0
	msg db "string after lowercase: ",0
section .bss
	dest resb 1000
section .text
	global lower
	extern printf
lower:
	enter 0,0
	mov esi,dword[ebp+8]
	mov edi,dest

	push msg1
	call printf
	add esp,4

	push msg
	call printf
	add esp,4
lp:
	mov al,byte[esi]
	cmp al,10
	je exit
	cmp al,96
	jle goto
	mov byte[edi],al
	jmp out
goto:  	cmp byte[esi],32
	je space
	add al,32
	mov byte[edi],al
	jmp out
space:
	mov byte[edi],al
out:
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
