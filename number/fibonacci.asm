	section .data
	msg db "fibonacci of which no you want",10,0
	no dd "%d",0
	no2 dd "%d ",10,0
	msg2 db "fibonacci is ",10,0
section .bss
	num resd 1
	n1 resd 1
	n2 resd 1
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

	push msg2
	call printf
	add esp,4

	mov dword[n1],1
	push dword[n1]
	push no2
	call printf
	add esp,8

	mov dword[n2],1
	push dword[n2]
	push no2
	call printf
	add esp,8

	mov eax,dword[n1]
	mov ebx,dword[n2]
	mov edx,2
	mov ecx,0
lp:	
	cmp dword[num],edx
	je endl
	add eax,ebx
	pusha 
	push eax
	push no2
	call printf
	add esp,8
	popa
	mov ecx,eax
	mov eax,ebx
	mov ebx,ecx
	inc edx
	jmp lp
	
endl:	ret
