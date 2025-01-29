section .data
	msg db "how many number you want in array:",10,0
	no dd "%d",0
	msg1 db "second maximum from array:%d",10,0
section .bss
	n resd 1	
	arr resd 100
	max resd 1
	max2 resd 1
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
	mov eax,arr
	mov ecx,0
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
	mov eax,arr
	mov ecx,0
	mov dword[max],0
lp3:
	mov esi,dword[eax]
	cmp ecx,dword[n]
	je endl
	cmp esi,dword[max]
	jge lp4
	jmp lp5
lp4:
	mov dword[max],esi
lp5:
	add eax,4
	inc ecx
	jmp lp3
	
endl:
	mov dword[max2],0
	mov eax,arr
	mov ecx,0

lp6:
	mov esi,dword[eax]
	cmp ecx,dword[n]
	je exit
	cmp esi,dword[max2]
	jle lp8
	

	
lp7:
	cmp esi,dword[max]
	jge lp8
	mov dword[max2],esi
lp8:
	inc ecx
	add eax,4
	jmp lp6
	
	
exit:
	pusha
	push dword[max2]
	push msg1
	call printf
	add esp,8
	popa
	ret
	
	
