section .data
	string db "Low",10,0
	len equ $-string
	string1 db "Low",10,0
	msg db "equal",10,0
	msg2 db "not equal",10,0
section .text
	global main
	extern printf
main:
	mov ecx,len
	mov esi,string
	mov edi,string1
	repe cmpsb
	
	cmp ecx,0
	je eq
	jmp neq

eq:
	push msg
	call printf
	add esp,4
	jmp endl
neq:
	push msg2
	call printf
	add esp,4
endl:
	ret
	
