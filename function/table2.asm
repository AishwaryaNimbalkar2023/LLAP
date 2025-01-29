section .text
	global main
	extern table

main:
	mov ebx,1

	push ebx
	call table
	add esp,4
	ret

