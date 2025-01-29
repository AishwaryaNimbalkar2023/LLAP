section .data
	string db "tHis IS a cAPitAL",0
	cls db "clear",0
section .bss
	output resd 50
	count resd 1
section .text
	global main
	extern puts,system
main:
	mov dword[count],0
myloop:
	inc dword[count]
	cmp dword[count],100
	je terminate
	push cls
	call system
	add esp,4

	mov esi,string
	mov edi,output
mylp:
	cmp byte[esi],32
	jz lp1
	cmp byte[esi],97
	jge lp
	add byte[esi],32
	jmp lp1
lp:
	sub byte[esi],32
lp1:
	mov al,byte[esi]
	mov byte[edi],al
	inc esi
	inc edi
	cmp byte[esi],0
	je endl
	jmp mylp

endl:
	push output
	call puts
	add esp,4
	jmp myloop
terminate:
	ret
	
