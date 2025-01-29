section .data
	line db "Low Level Programming",0
;	msg db "%d",10,0
section .bss
	dest resd 100
section .text
	global main
	extern puts
main:
	mov esi,line
	mov edi,dest
lp:
	mov al,byte[esi]
	cmp al,0
	je out
	cmp al,96
	jle space
	sub al,32
	mov byte[edi],al
	jmp p

space:
	cmp al,32
	je goto
	add al,32
	mov byte[edi],al
goto:
	mov byte[edi],al
	jmp p
	
p:
	inc esi
	inc edi
	jmp lp
out:
	push dest
	call puts
	add esp,4
	ret
	
