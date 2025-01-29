section .text
	global main
	extern fact

main:
	mov ebx,4
	
	push ebx
	call fact
	add esp,4
	ret
	
