%macro fact 1
	mov eax,1
	mov ebx,%1
%%b:	cmp ebx,0
	jz %%a
	mul ebx
	dec ebx
	jmp %%b

%%a: 
%endmacro

section .data
        msg db "factorial is:%d",10,0
section .text
        global main
        extern printf
main:
        fact 4
        push eax
        push msg
        call printf
        add esp,8
        ret


