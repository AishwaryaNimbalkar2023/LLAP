section .text
	global main
	extern fibo,fact,table
main:


	mov ecx,0
        mov eax,1
        mov edx,6
	push ecx
	push eax
        push edx
        call fibo
        add esp,12
        
	
	mov ebx,3
	push ebx
        call fact
        add esp,4
       

	mov ebx,1
	push ebx
        call table
        add esp,4
        ret


