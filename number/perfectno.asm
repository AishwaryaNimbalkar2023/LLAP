section .data
	msg db "enter a number",10,0
	no db "%d",0
	msg1 db "it is perfect number",10,0
	msg2 db "it is not perfect number",10,0
section .bss
	num resd 1
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
	mov ebx,1
	xor edx,edx
	mov dword[sum],0
lp:	div ebx
	cmp ebx,dword[num]
	jge lp2
	cmp edx,0
	je lp1
	inc ebx
	mov eax,dword[num]
	jmp lp
lp1:	mov eax,ebx
	add eax,dword[sum]
	mov dword[sum],eax
	inc ebx
	mov eax,dword[num]
	jmp lp
	
lp2:
	mov eax,dword[sum]
	mov esi,dword[num]
	cmp eax,esi
	je lp3
	push msg2
	call printf
	add esp,4	
	jmp lp4
lp3:
	push msg1
	call printf
	add esp,4
lp4:
	ret
