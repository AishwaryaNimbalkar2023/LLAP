section .data
	msg1 db " ",10,0
	msg db "string after uppercase: ",0
section .bss
	dest resd 1000
section .text
	global upper
	extern printf
upper:
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
	jg goto
	mov byte[edi],al
	jmp out
goto:
	sub al,32
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

