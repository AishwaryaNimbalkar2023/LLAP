%macro table 2
	
	mov ebx,%2
	mov ecx,1
%%a:	mov eax,%1
	cmp ebx,ecx
	je %%b
	mul ecx
	pusha 
	push eax
	push msg
	call printf
	add esp,8
	popa
	inc ecx
	jmp %%a

%%b:
	%endmacro

section .data
	msg1 db "table of 2:",10,0
	msg db "%d",10,0
section .text
	global main
	extern printf
main:

	push msg1
	call printf
	add esp,4

	table 2,11

	ret

	
