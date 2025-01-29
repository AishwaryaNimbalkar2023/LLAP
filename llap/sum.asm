section .data
 	msg db"%d",10,0
section .text
	global main
	extern printf
main:
	mov eax,10
        mov ebx,eax
lp:     dec ebx
        cmp ebx,0
        je exit
        add eax,ebx
        jmp lp
exit:   push eax
        push msg
        call printf
        add esp,8
        ret


