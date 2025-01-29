section .data
	msg db "enter a table of:",10,0
	no dd "%d",0
	msg2 db "%d",10,0
section .bss
	num resd 1
section .text
	global main
	extern printf,scanf
main:

	push msg 
	call printf
	add esp,4
	
	push num
	push no
	call scanf
	add esp,8

	mov ecx,1

lp:	cmp ecx,11
	je endl
	mov eax,dword[num]
	mul ecx
	pusha
	push eax
	push msg2
	call printf
	add esp,8
	popa
	inc ecx
	jmp lp



endl:	ret
	
	
