section .data
	msg db "factorial of which number you want:",10,0
	no dd "%d",0
	no2 dd "%d",10,0
	msg2 db "factorial of %d is:",10,0
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

	push dword[num]
	push msg2
	call printf
	add esp,8

	mov eax,dword[num]
	mov ebx,1
lp:	cmp ebx,dword[num]
	je endl
	mul ebx
	inc ebx
	jmp lp

endl:
	pusha
	push eax
	push no2
	call printf
	add esp,8
	popa
	ret
