section .data
	msg db "how many element you want in array:",10,0
	no dd "%d",0
	msg1 db "minimum number from array:%d",10,0
section .bss
	n resd 1
	arr resd 100
	min resd 1

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

	mov eax,arr
	mov ecx,0
lp:
	cmp ecx,dword[n]
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
	mov ecx,1
	mov edx,dword[n]
	mov ebx,dword[eax]
goto:
	add eax,4
	mov esi,dword[eax]
	cmp ecx,edx
	je out
	cmp esi,ebx
	jge lp4
	
lp3:
	mov ebx,esi
lp4:
	dec edx
	jmp goto
out:
	push ebx
	push msg1
	call printf
	add esp,8
	ret


