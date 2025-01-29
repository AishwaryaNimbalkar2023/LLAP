section .data
	num1 dq 12.12
	num2 dq 12.12
	msg1 db "%f",0
	msg db "addition of two number:%f",10,0
section .bss
;	num1 resq 1
;	num2 resq 1
	sum resq 1
section .text
	global main
	extern printf,scanf
main:
;	push num1
;	push msg1
;	call scanf
;	add esp,8
;
;	push num2
;	push msg1
;	call scanf
;	add esp,8
	
	
	
	fld qword[num1]
	fld qword[num2]
	fadd st0,st1
	
	sub esp,8
	fstp qword[esp]
	push msg
	call printf
	add esp,12
	ret
	
	
	
	
