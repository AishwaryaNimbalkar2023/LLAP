section .data
	msg db "enter a number",10,0
	no dd "%d",10,0
	msg2 db "number after reverse:%d",10,0
section .bss
	num resd 1
	rem resd 1
	rev resd 1
	quo resd 1
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
	mov dword[rev],0
lp:	cmp eax,0
	je endl
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

endl:
	push dword[rev]
	push msg2
	call printf
	add esp,8
	ret
	
	
