section .data
	msg db "enter a number:",10,0
	no dd "%d",0
	no1 db "%d",10,0
	msg2 db "number divisible by 3:",10,0
	
section .bss
	myarr resd 10
	num resd 1
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
	
	xor ecx,ecx
lp:	mov esi,myarr
	mov eax,4
	mul ecx
	add esi,eax
	pusha
	push esi
	push no
	call scanf
	add esp,8
	popa
	inc ecx
	cmp ecx,dword[num]
	jne lp
goto:
	push msg2
	call printf
	add esp,4

	xor ecx,ecx

lp2:	cmp ecx,dword[num]
	je endl
	mov ebx,myarr
	mov eax,4
	mul ecx
	add ebx,eax
	mov eax,dword[ebx]
	mov esi,3
	div esi
	cmp edx,0
	je outer
	inc ecx
	jmp lp2
	
outer:
	pusha
	push dword[ebx]
	push no1
	call printf
	add esp,8
	popa
	inc ecx
	jmp lp2
endl:
	ret		
