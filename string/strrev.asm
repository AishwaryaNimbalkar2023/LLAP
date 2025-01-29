section .data
	string db "low level assembly",10,0
	len equ $-string
section .bss
	dest resd 1
section .text
	global main
	extern printf
main:
	
	mov esi,string
	mov edi,dest
	mov ecx,len
	add esi,ecx
	sub esi,1
loop:	cmp ecx,0
	je go
	mov al,byte[esi]
	mov byte[edi],al
	pusha
	push dest
	call printf
	add esp,4
	popa
	dec ecx
	sub esi,1
	jmp loop

go:
	ret

