section .data
	msg db "enter a number:",10,0
	no dd "%d",0
	msg1 db "it is armstrong number",10,0
	msg2 db "it is not armstrong number",10,0
section .bss
	num resd 1
	quo resd 1
	rem resd 1
	sum resd 1
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
	

	mov eax,dword[num]
	xor ecx,ecx
	mov ebx,10
	xor edx,edx
	
lp:

	div ebx
	inc ecx
	mov dword[quo],eax
;	mul ebx
	mov eax,dword[quo]
	cmp eax,0
	jnz lp
	
lp2:
	mov eax,dword[num]
	xor edx,edx
	mov dword[sum],0

lp3:
	mov ebx,10
	div ebx
	mov dword[rem],edx
	mov dword[quo],eax
	mov eax,dword[rem]
	mov ebx,dword[rem]
	mov esi,ecx
lp4:	cmp esi,1
	je lp5
	mul ebx
	dec esi
	jmp lp4
lp5:
	add eax,dword[sum]
	mov dword[sum],eax
	mov eax,dword[quo]
	cmp eax,0	
	jne lp3
lp6:
	mov esi,dword[num]
	mov edi,dword[sum]
	cmp esi,edi
	je lp7
	push msg2
	call printf
	add esp,4
	jmp lp8
lp7:
	push msg1
	call printf
	add esp,4
lp8:
	ret











