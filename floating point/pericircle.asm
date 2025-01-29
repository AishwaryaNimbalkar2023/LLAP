section .data
	r dq 2.0
	two dd 2
	msg db "perimeter of circle is:%d",10,0
section .text
	global main
	extern printf
main:
	fldpi
	fld qword[r]
	fmul st1
	fild dword[two]
	fmul st1
	
	sub esp,16
	fstp dword[esp]
	push msg
	call printf
	add esp,20
	ret



