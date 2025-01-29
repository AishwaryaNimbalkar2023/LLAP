section .data
	msg1 db " ",10,0
	msg db "copied string: ",0
section .bss
	dest resb 1000
section .text
	global cpy
	extern printf
cpy:
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
	cmp al,0
	je exit
	mov byte[edi],al
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
