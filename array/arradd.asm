section .data
	msg db "how many no you want in array:",10,0
	no1 dd "%d",0
	no2 db "%d",10,0
	msg2 db "array is:",10,0
	msg3 db "sum of array:%d",10,0
	
section .bss
	arr resd 10
	num resd 1
	sum resd 1
section .text
	
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	push num
	push no1
	call scanf
	add esp,8

	mov eax,arr
	xor edx,edx
	mov ecx,dword[num]

lp:	cmp ecx,edx
	je goto
	pusha
	push eax
	push no1
	call scanf
	add esp,8
	popa
	inc edx
	add eax,4
	jmp lp

goto:
	push msg2
	call printf
	add esp,4

	xor edx,edx
	mov eax,arr
	mov ecx,dword[num]
lp2:	cmp ecx,edx
	je go
	pusha
	push dword[eax]
	push no2
	call printf
	add esp,8
	popa
	add eax,4
	inc edx
	jmp lp2

go:
	xor edx,edx
	mov ebx,dword[num]
	mov esi,arr
	mov dword[sum],0
lp3:	cmp ecx,edx
	je endl
	mov eax,dword[esi]
	add eax,dword[sum]
	mov dword[sum],eax
	add esi,4
	inc edx
	jmp lp3

endl:
	push dword[sum]
	push msg3
	call printf
	add esp,8
	ret











	
