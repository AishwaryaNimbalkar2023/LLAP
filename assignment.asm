section .data
	source db "23111001 abhay 12/01/2002 pune m msc 9876908754 2023",10
	db "23111002 aishwarya 01/09/2001 satara f msc 8769076549 2023",10
	db "23111001 shruti 23/12/2002 nashik f mca 9095004534 2023",10
	db "23111005 piyush 18/07/2000 mumbai m mca 8756432145 2023",10
	db "23111012 shraddha 23/10/2001 pune f msc 7896543210 2023",10,0 
section .bss
	dest resd 1000
section .text
	global main
	extern puts
main:
	mov esi,source
start:	xor ecx,ecx
	mov edi,dest
lp:	cmp byte[esi],0
	je lp8
	cmp byte[esi]," "
	je lp2
	inc esi
	jmp lp
lp2:
	mov al,byte[esi]
	mov byte[edi],al
	inc esi
	inc edi
	cmp byte[esi]," "
	je lp10
	jmp lp2

lp10:	 mov byte[edi],0x00
	
	
lp3:	cmp ecx,3
	je lp5
	cmp byte[esi]," "
	je lp4
	inc esi
	jmp lp3
lp4:
	inc esi
	inc ecx
	jmp lp3
lp5:
	cmp byte[esi],'f'
	jne lp7
	inc esi
	cmp byte[esi]," "
	jne lp7
	inc esi
	cmp byte[esi],'m'
	jne lp7
	inc esi
	cmp byte[esi],'s'
	jne lp7
	inc esi
	cmp byte[esi],'c'
	jne lp7
	inc esi
	cmp byte[esi]," "
	je lp6
	jmp lp7
lp6:	push dest
	call puts
	add esp,4
lp7:
	inc esi
	cmp byte[esi],10
	je lp9
	jmp lp7 
lp9:	inc esi
	jmp start
lp8:	ret
	
	
	
	
