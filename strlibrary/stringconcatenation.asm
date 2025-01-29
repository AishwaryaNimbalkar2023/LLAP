section .data
	msg db "string after concatenation: ",0
section .bss
	dest resb 1000
section .text
	global concate
	extern puts,printf
concate:
	enter 0,0
	mov esi,dword[ebp+8]
	mov ebx,dword[ebp+12]
	mov edi,dest
	
	push msg
	call printf
	add esp,4
lp:
	mov al,byte[esi]
	cmp al,0
	je goto1
	mov byte[edi],al
	inc esi
	inc edi
	jmp lp
	
goto1:   
	cmp byte[ebx],0
	je exit
	mov al,byte[ebx]
	mov byte[edi],al
	inc ebx
	inc edi
	jmp goto1
exit:
	pusha 
	push dest	
	call puts
	add esp,4
	popa
	leave
	ret
