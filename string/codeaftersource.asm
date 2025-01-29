section .data
	string db "a source code is object code",10,
	db"source code is source code",10
	db "a source coding",10,0
	msg db "count is:%d",10,0
section .text
	global main
	extern printf
main:
	mov esi,string
	xor ecx,ecx
lp:
	cmp byte[esi],0
	je out
lp2:	cmp byte[esi],'s'
	jnz go
	inc esi
	cmp byte[esi],'o'
	jnz go
	inc esi
	cmp byte[esi],'u'
	jnz go
	inc esi
	cmp byte[esi],'r'
	jnz go
	inc esi
	cmp byte[esi],'c'
	jnz go
	inc esi
	cmp byte[esi],'e'
	je inner
	jne go
inner:
	inc esi
	cmp byte[esi]," "
	jnz go
	inc esi
	cmp byte[esi],'c'
	jnz go
	inc esi
	cmp byte[esi],'o'
	jnz go
	inc esi
	cmp byte[esi],'d'
	jnz go
	inc esi
	cmp byte[esi],'e'
	je outer
	jmp go
outer:
	inc ecx
	
	
go:
	inc esi
	jmp lp

out:
	push ecx
	push msg
	call printf
	add esp,8
	ret
