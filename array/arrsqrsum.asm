section .data
	msg dd "%d",0
	msg1 db "sum of array:%d",10,0
section .bss
	no resd 1
	arr resd 100
	sum resd 1
section .text
	global main
	extern printf,scanf
main:
	push no
	push msg
	call scanf
	add esp,8

	mov eax,arr
	xor edx,edx
lp:	cmp edx,dword[no]
	je inner
	pusha
	push eax
	push msg
	call scanf
	add esp,8
	popa
	inc edx
	add eax,4
	jmp lp

inner:
	mov esi,arr
	xor ecx,ecx
	mov dword[sum],0
lp2:
	cmp ecx,dword[no]
	je lp3
	mov eax,dword[esi]
	mov ebx,dword[esi]
	mul ebx
	add eax,dword[sum]
	mov dword[sum],eax
	inc ecx
	add esi,4
	jmp lp2
lp3:	pusha
	push dword[sum]
	push msg1
	call printf
	add esp,8
	popa
	ret
	
	
	
