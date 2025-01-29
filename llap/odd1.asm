section .data
	a dd 5
	msg db "this is odd number",10,0
	msg1 db "this is not odd number",10,0
section .text
	global main
	extern printf
main:
	xor edx,edx
	mov eax,dword[a]
    
       
        mov ebx,2
        div ebx
        cmp edx,0
        jne lp2
	push msg
	call printf
	add esp,4
	jmp exit
	
        
lp2:
	push msg1
	call printf
	add esp,4
exit: 	ret	
