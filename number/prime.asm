section .data
	msg db "which number do you want:",10,0
	no dd "%d",0
	msg1 db "%d is a prime number",10,0
	msg2 db "%d is not a prime number",10,0
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
	mov ebx,1
	mov ecx,0
lp:	cmp ebx,dword[num]
	je goto
	div ebx
	mov dword[rem],edx
	cmp dword[rem],0
	jz count
	jmp back
count:
	inc ecx
back:	inc ebx
	jmp lp

goto:
	cmp ecx,1
	jnz lp2
	
	push dword[num]
	push msg1
	call printf
	add esp,8
	jmp endl

lp2:
	push dword[num]
	push msg2
	call printf
	add esp,8
	
endl:
	ret
	
	
