section .text
        global length

length:

        enter 0,0
        mov esi,dword[ebp+8]
        xor ecx,ecx

lp:
        cmp byte[esi],0
        je exit
        inc ecx
        inc esi
        jmp lp
exit:
        leave
        ret
 
