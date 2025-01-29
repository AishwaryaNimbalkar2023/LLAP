section .data
	msg db "%d",0
	msg1 db "addition is:%f",10,0
section .bss
	n resq 1
	sum resq 1
	deno resq 1
	numra resq 1
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
	xor edx,edx
	mov eax,ecx
	mov ebx,2
	mul ebx
	add eax,ecx
	mov dword[numra],eax
	
	mov eax,ecx
	mov ebx,ecx
lp2:	dec ebx
	cmp ebx,0
	je lp3
	mul ebx
	jmp lp2
lp3:
	mov esi,eax
	mov ebx,2
	mul ebx
	add eax,esi
	mov dword[deno],eax	
	fild qword[deno]
	fild qword[numra]
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
