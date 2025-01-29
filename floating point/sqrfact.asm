section .data
	msg db "%d",0
	msg1 db "addition is:%f",10,0
section .bss
	sum resq 1
	sqr resd 1
	fact resd 1
	n resq 1
section .text
	global main
	extern printf,scanf
main:
	push n 
	push msg
	call scanf
	add esp,8
	
	fldz
	fstp qword[sum]
	mov ecx,dword[n]

	
lp:	
	mov eax,ecx
	xor edx,edx
	mov ebx,eax
	mul ebx
	mov dword[sqr],eax
	mov eax,ebx

lp2:
	dec ebx
	cmp ebx,0
	je out
	mul ebx
	jmp lp2

out:
	mov dword[fact],eax
	fild dword[fact]
	fild dword[sqr]
	fdiv st1
	fadd qword[sum]
	fstp qword[sum]
	loop lp

	fld qword[sum]

	sub esp,16
	fstp qword[esp]
	push msg1
	call printf
	add esp,20
	ret
	
	
	
	
	
