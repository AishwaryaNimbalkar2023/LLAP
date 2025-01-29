section .data
	msg db "enter a number:",10,0
	no dd "%d",0
	msg1 db "reverse number:",10,0
	no1 db "%d",10,0
	msg2 db "%d is pallindrome number",10,0
	msg3 db "%d is not a pallindrome number",10,0
section .bss
	num resd 1
	rev resd 1
	quo resd 1
	rem resd 1
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

	xor edx,edx
	mov eax,dword[num]
	mov ecx,0
	mov dword[rev],0
lp:
	cmp eax,ecx
	jz reverse
	mov ebx,10
	div ebx
	mov dword[quo],eax
	mov dword[rem],edx
	mov eax,dword[rev]
	mul ebx
	add eax,dword[rem]
	mov dword[rev],eax
	mov eax,dword[quo]
	jmp lp
	
reverse:
	push msg1
	call printf
	add esp,4


	push dword[rev]
	push no1
	call printf
	add esp,8

pallind:
	mov eax,dword[num]
	mov ebx,dword[rev]
	cmp eax,ebx
	jz equal
	
	push dword[num]
	push msg3
	call printf
	add esp,8
	jmp endl

equal:
	push dword[num]
	push msg2
	call printf
	add esp,8

endl:
	ret
