section .data
	msg db "fibonicces number",10,0
 	msg1 db "%d",10,0
	a db "%d",10,0
	b db "%d",10,0
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
	add esp,8
	
	mov dword[n1],0
	push num
	push a
	call scanf
	add esp,8
	
	mov dword[n2],1
	push num
	push b
	call scanf
	add esp,8
	
	mov eax,dword[n1]
	mov ebx,dword[n2]
	mov ecx,0

lp:
	cmp dword[n1],eax
	jz exit 
	add eax,ebx
	pusha
	push eax
	push n1
	call printf
	add esp,8
	popa
	mov ecx,eax
	mov eax,ebx
	mov ebx,ecx
	jmp lp
exit:	ret
	                                                                                                                                                                                
                
