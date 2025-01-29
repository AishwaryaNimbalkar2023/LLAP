section .data
	input dd "%d",0
	msg db "after sorting:",10,0
	input2 db "%d",10,0
section .bss
	n resd 1
	myarr resd 10
section .text
	global main
	extern printf,scanf
main:
	pusha
	push n
	push input
	call scanf
	add esp,8
	popa 

	xor ecx,ecx
	mov eax,myarr
lp:	pusha
	push eax
	push input
	call scanf
	add esp,8
	popa
	inc ecx
	add eax,4
	cmp ecx,dword[n]
	je out
	jmp lp


out:	push msg
	call printf
	add esp,4


	mov ecx,dword[n]
goto:	mov esi,myarr
	xor edx,edx

lp3:	inc edx
	cmp ecx,edx
	jne loop

lp2:
	dec ecx
	cmp ecx,0
	je endl 	
	jmp goto

loop:
	mov ebx,dword[esi]
	mov edi,esi
	add edi,4
	cmp ebx,dword[edi]
	jle swap
	xchg ebx,dword[edi]
swap:
	mov dword[esi],ebx
	add esi,4
	jmp lp3


endl:
	mov esi,myarr
	xor ebx,ebx

inner:	pusha
	push dword[esi]
	push input2
	call printf
	add esp,8
	popa
	inc ebx
	add esi,4

	cmp ebx,dword[n]
	je end
	jmp inner

end:
	ret
	
	
