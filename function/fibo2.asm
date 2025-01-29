section .text
	global main
	extern fibo
main:
	mov ecx,0
	mov eax,1
	mov edx,6

	push ecx
	
	push eax
	push edx
	call fibo
	add esp,12
	ret

	 
