section .data  
	msg3 dd "%d",0
        msg1 db "array element after square:",10,0 
	msg dd " %d ",10,0
	msg2 db "sum of array:%d",10,0
section .bss 
        no resd 1 
        arr resd 100 
        sum resd 1 
section .text 
        global main 
        extern printf,scanf 
main: 
        push no 
        push msg3 
        call scanf 
        add esp,8 
 
        mov eax,arr 
        xor edx,edx 
lp:     cmp edx,dword[no] 
        je inner 
        pusha 
        push eax 
        push msg3 
        call scanf 
        add esp,8 
        popa 
        inc edx 
        add eax,4 
        jmp lp 
 
inner:
	push msg1
	call printf
	add esp,4
 
        mov esi,arr 
        xor ecx,ecx 
     
lp2: 
        cmp ecx,dword[no] 
        je lp3 
        mov eax,dword[esi] 
        mov ebx,dword[esi] 
        mul ebx 
	pusha
        push eax
	push msg
	call printf
	add esp,8
	popa
	inc ecx
	add esi,4
	add eax,4
	jmp lp2
lp3:
	mov dword[sum],0
	mov esi,arr
	xor ecx,ecx
out:
	ret


