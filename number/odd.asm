section .data
	msg db "enter a number:",10,0
	no dd "%d",0
	msg1 db "%d is odd number",10,0
	msg2 db "%d is not a odd number",10,0
section .bss
	num resd 1
	rem resd 1
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
	mov ebx,2
	div ebx
	mov dword[rem],edx
	cmp dword[rem],0
	jz goto
	push dword[num]
	push msg1 
	call printf
	add esp,8
	jmp endl

goto:
	push dword[num]
	push msg2
	call printf
	add esp,8
	
endl:
	ret  
