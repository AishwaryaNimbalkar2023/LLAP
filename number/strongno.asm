section .data
	msg db "enter a number",10,0
	no dd "%d",0
	msg1 db "it is strong number",10,0
	msg2 db "it is not a strong number",10,0
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
	xor edx,edx
	mov ebx,10
	mov dword[sum],0

lp:
	div ebx
	mov dword[rem],edx
	mov dword[quo],eax
	mov eax,dword[rem]
	mov ecx,dword[rem]
	cmp ecx,1
	je lp2
	cmp ecx,0
	je lp3
	dec ecx
	
lp2:	mul ecx
	dec ecx
	cmp ecx,0
	jne lp2
lp3:
	add eax,dword[sum]
	mov dword[sum],eax
	mov eax,dword[quo]
	cmp eax,0
	jne lp
lp4:
	mov esi,dword[sum]
	cmp esi,dword[num]
	je lp5
	push msg2
	call printf
	add esp,4
	jmp lp6
lp5:
	push msg1
	call printf
	add esp,4
lp6:
	ret
	
	

