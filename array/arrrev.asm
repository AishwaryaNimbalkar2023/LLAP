section .data
	msg dd "%d",10,0
	msg2 db "%d",10,0
section .bss
	myarr resd 10
	num resd 1
section .text
	global main
	extern printf,scanf
main:
	push num
	push msg
	call scanf
	add esp,8

	xor edx,edx
	mov esi,myarr
	mov ecx,dword[num]
lp:	cmp ecx,edx
	je go
	pusha
	push esi
	push msg
	call scanf
	add esp,8
	popa
	add esi,4
	inc edx
	jmp lp

go:
	mov esi,myarr
	mov eax,4
	mov ecx,dword[num]
	mul ecx
	add esi,eax
	sub esi,4
lp2:
	pusha
	push dword[esi]
	push msg2
	call printf
	add esp,8
	popa
	dec ecx
	sub esi,4
	cmp ecx,0
	je endl
	jmp lp2
endl:
	ret
	
