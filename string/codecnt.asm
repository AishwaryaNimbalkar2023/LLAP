section .data
	string db "decodeing into machine code ,byte code or another programming language",10,
	db "code into machine code ,byte code or another programming language",10,
	db "code into machine code ,byte code or another programming language",10,
	db "code into machine code ,byte code or another programming language",10,
	db "code into machine code ,byte code or another programming language",10,0
	msg db "%d",10,0
section .text
	global main
	extern printf
main:
	mov esi,string
	xor ecx,ecx
lp:	cmp byte[esi],0
	je endl
	cmp byte[esi],'c'
	jnz goto
	inc esi
lp2:	cmp byte[esi],'o'
	jnz goto
	inc esi
	cmp byte[esi],'d'
	jnz goto
	inc esi
	cmp byte[esi],'e'
	je skip
	jmp goto
	
skip:	inc esi
	cmp byte[esi]," "
	jne goto
	inc ecx
goto:
	cmp byte[esi]," "
	jnz lp2
	inc esi
	jmp lp
endl:
	push ecx
	push msg
	call printf
	add esp,8
	ret
