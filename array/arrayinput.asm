section .data
	msg db "%d",0
section .bss
	myarr resd 1
	n resd 1
section .text
	global main
	extern printf, scanf
main:
	pusha
	push n
	push msg
	call scanf
	add esp,8
	popa   
         

	mov esi,myarr
	mov ecx,0
	mov eax,dword[n]
lp:	cmp ecx,eax
	je endl
	pusha	
	push esi
	push msg
	call scanf
	add esp,8
	popa
	add esi,4
	inc ecx
	jmp lp
endl:	ret
