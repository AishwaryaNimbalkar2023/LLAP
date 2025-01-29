section .data
	msg dd "%d ",0
section .text
	global fibo
	extern printf

fibo:
	pusha
	push ecx
	push msg
	call printf
	add esp,8
	popa

	pusha
	push eax
	push msg
	call printf
	add esp,8
	popa
	
lp:	mov ebx,eax

	add eax,ecx
	pusha
	push eax
	push msg
	call printf
	add esp,8
	popa
	mov ecx,ebx
	dec edx
	cmp edx,0
	jne lp
	ret
	
	


