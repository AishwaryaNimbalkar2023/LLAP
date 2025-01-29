section .data
	string db "this is my country ",10,0
	len equ $-string
section .bss
	dest resb 100
	temp resb 100
	dest1 resb 100
section .text
	global main
	extern printf
main:
	mov esi,string
	mov edi,dest
	xor ecx,ecx
lp:
	mov al,byte[esi]
	cmp al,0
	je lp4
	inc esi
	inc ecx
;	cmp al,10
;	je lp1
	cmp al," "
	jne lp
lp1:	sub esi,1
	mov edx,ecx
lp2:	mov al,byte[esi]
	cmp edx,0
	je lp3
	mov byte[edi],al
	dec esi
	inc edi
	dec edx
	jmp lp2
	
lp3:	add esi,ecx
	inc esi
	mov ecx,0
	jmp lp
	
lp4:
	pusha
	push dest
	call printf
	add esp,4
	popa

	mov esi,string
	mov edi,temp
	mov edx,len
	dec edx
	add esi,edx
	dec esi
lp7:
	mov al,byte[esi]
	cmp edx,0
	je lp8
	mov byte[edi],al
	dec esi
	inc edi
	dec edx
	jmp lp7
lp8:
	mov esi,temp
	mov edi,dest1
lp9:
	mov al,byte[esi]
	cmp al,0
	je exit
	cmp al,96
	jle lp10
	sub al,32
	mov byte[edi],al
	jmp lp11
lp10:
	cmp al,32
	je space
	mov byte[edi],al
	jmp lp11
space:
	mov byte[edi],al
	jmp lp13
lp11:
	inc esi
	inc edi
	mov al,byte[esi]
	cmp al,0
	je exit
	cmp al,96
	jle lp12
	mov byte[edi],al
	jmp lp13
lp12:
	cmp al,32
	je space1
	add al,32
	mov byte[edi],al
	jmp lp13

space1:
	mov byte[edi],al
lp13:
	inc esi
	inc edi
	jmp lp9
exit:
	pusha
	push dest1
	call printf
	add esp,4
	popa
	ret
	

	




















