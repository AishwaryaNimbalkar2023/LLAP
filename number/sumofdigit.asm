section .data
	msg db "enter a number:",10,0
	no dd "%d",10,0
	msg2 db "addtion of number:%d",10,0
section .bss
	num resd 1
	rem resd 1
	quo resd 1
	sum resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4
	
	push num
	push no
	call scanf
	add esp,8

	mov eax,dword[num]
	mov ebx,10
       	mov dword[sum],0
	xor edx,edx
lp:
	div ebx
	mov dword[quo],eax
	mov eax,dword[sum]
	add eax,edx
	mov dword[sum],eax
	mov eax,dword[quo]
	mov edx,0
	cmp eax,0
	je end
	jmp lp
end:
	pusha
	push dword[sum]
	push msg2
	call printf
	add esp,8
	popa
	ret
