section .data
	msg db "count of word in array:%d",10,0
section .text
	global wordcnt
	extern printf
wordcnt:
	enter 0,0
	mov eax,dword[ebp+8]
	mov esi,eax
	xor edx,edx
lp1:	cmp byte[esi],0
	je out
	cmp byte[esi]," "
	jne goto
	inc edx
goto:
	inc esi
	jmp lp1
out:
	inc edx	
exit:
	pusha
	push edx
	push msg
	call printf
	add esp,8
	popa
	leave 
	ret
	
