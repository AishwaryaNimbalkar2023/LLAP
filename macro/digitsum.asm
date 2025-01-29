%macro num 1
	mov eax,%1
	mov dword[sum],0
	mov ebx,10
	xor edx,edx
%%b:
	cmp eax,0
	je %%a
	div ebx
	mov dword[quo],eax
	mov dword[rem],edx
	mul ebx
	mov eax,dword[rem]
	add eax,dword[sum]
	mov dword[sum],eax
	mov eax,dword[quo]
	jmp %%b
%%a:
	%endmacro
section .data
	msg db "sum of digit is:%d",10,0
section .bss
	sum resd 1
	quo resd 1
	rem resd 1
section .text
	global main
	extern printf
main:
	num 123
	push dword[sum]
	push msg
	call printf
	add esp,8
	ret
	
