section .data
	input dd 12,23,43,25,19,-1
	msg db "%d",10,0
section .text
	global main
	extern printf
main:
	mov ecx,0
	mov eax,input
lp:	cmp dword[eax],-1
	je loop
	inc ecx
	add eax,4
	jmp lp
	
loop:
	pusha
	push ecx
	push msg
	call printf
	add esp,8
	popa

loop2:
	mov edx,1
	mov eax,input
loop5:	cmp ecx,edx
	je loop4
	mov esi,dword[eax]
	mov eax,4
	mul edx
	mov edi,dword[eax]
	cmp esi,edi
	jle loop3
	xchg esi,edi
	
loop3:	inc edx
	jmp loop5
	
loop4:	dec ecx
	mov edx,1
	cmp ecx,0
	je loop7
	jmp loop2
loop7:
	pusha
	push dword[eax]
	push msg
	call printf
	add esp,8
	popa
	ret

	
	
	
