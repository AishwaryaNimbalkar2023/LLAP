%macro num 1
	mov eax,%1
	mov dword[rev],0
	mov ebx,10
	xor edx,edx
	
%%b:
	cmp eax,0
	jz %%a
	div ebx
	mov dword[quo],eax
	mov dword[rem],edx
	mov eax,dword[rev]
	mul ebx
	add eax,dword[rem]
	mov dword[rev],eax
	mov eax,dword[quo]
	jmp %%b


%%a:
%endmacro

section .data
	msg db "number after reverse:%d",10,0
section .bss
	quo resd 1
	rev resd 1
	rem resd 1
section .text
	global main
	extern printf
	
main:
	num 623
	push dword[rev]
	push msg
	call printf
	add esp,8
	ret

		
