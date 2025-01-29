section .data
	msg db "how many number you want in array:",10,0
	no dd "%d",0
	no1 db "%d",10,0
	msg2 db "array is:",10,0
	msg3 db "maximum is:%d",10,0
section .bss
	n resd 1
	myarr resd 1
	max resd 1
section .text
	global main
	extern printf,scanf
		
main:
	push msg
	call printf
	add esp,4

	push n 
	push no
	call scanf
	add esp,8
	
	mov ebx,dword[n]
	mov ecx,0
	mov eax,myarr

lp:
	cmp ebx,ecx
	je lp2
	pusha
	push eax
	push no
	call scanf
	add esp,8
	popa
	inc ecx
	add eax,4
	jmp lp

lp2:	

	
	push msg2
	call printf
	add esp,4
	
	mov ecx,0
	mov ebx,dword[n]
	mov eax,myarr
lp3:	cmp ecx,ebx
	je lp4
	pusha
	push dword[eax]
	push no1
	call printf
	add esp,8
	popa
	inc ecx
	add eax,4
	jmp lp3
	

lp4:	
	mov dword[max],0
	mov edx,0
	mov eax,myarr
lp5:	mov esi,dword[eax]
	cmp dword[n],edx
	je endl
	cmp esi,dword[max]
	jge lp7
	jmp lp6

	
lp7:
	mov dword[max],esi
lp6:	add eax,4
	inc edx
	jmp lp5
endl: 
	pusha
	push dword[max]
	push msg3
	call printf
	add esp,8
	popa
	ret
