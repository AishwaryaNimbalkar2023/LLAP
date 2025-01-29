section .data
	msg db "enter a number",10,0
	no dd "%d",0
	msg2 db "it is pallindrome number",10,0
	msg3 db "it is not pallindrome number",10,0
section .bss
	a resd 1
	rem resd 1
	sum resd 1
section .text
	global main
	extern printf,scanf
	
main:
	push msg
	call printf
	add esp,4

	push a
	push no
	call scanf
	add esp,8
	
	mov esi,dword[a]
	mov eax,dword[a]
lp:	cmp eax,0
	je lp2
	mov ebx,10
	div ebx
	mov dword[rem],edx
	mov ecx,eax
	mov eax,dword[sum]
	mul ebx
	add eax,dword[rem]
	mov dword[sum],eax
	mov eax,ecx
	jmp lp
	
lp2:
	cmp esi,dword[sum]
	jne lp3
	push msg2
	call printf
	add esp,4
	jmp exit
lp3:
	push msg3
	call printf
	add esp,4
exit:
	ret
