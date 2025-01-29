section .data
	msg db "value of a:",10,0
	no dd "%d",10,0
	msg3 db "value of b:",10,0
	msg1 db "after exchange value of a:%d",10,0
	msg2 db "after exchange value of b:%d",10,0

section .bss
	a resd 1
	b resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4	

	push a
	push no
	call scanf
	add esp,8
	
	push msg3
	call printf
	add esp,4
	
	push b 
	push no
	call scanf
	add esp,8

	mov eax,dword[a]
	mov esi,dword[b]
	xchg eax,esi

	push eax
	push msg1
	call printf
	add esp,8

	push esi
	push msg2
	call printf
	add esp,8
ret
