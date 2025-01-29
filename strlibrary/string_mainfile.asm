section .data
        string db "Low Level programming",10,0
	string1 db "programming",0
	string2 db "language",10,0
       	msg db "length of string:%d",10,0
section .text
        global main
        extern printf,length,reverse,wordcnt,cngcase,upper,lower,cpy,pallindrome,concate

main:

	mov esi,string
	push esi
	call printf
	add esp,4
	
       	mov esi,string
        push esi
        call length
        add esp,4

        push ecx
        push msg
        call printf
        add esp,8
	
	mov esi,string
	push esi
	call reverse
	add esp,4

	mov esi,string
	push esi
	call wordcnt
	add esp,4
	
	mov esi,string
	push esi
	call cngcase
	add esp,4

	mov esi,string
	push esi
	call upper
	add esp,4

	mov esi,string
	push esi
	call lower
	add esp,4
	
	mov esi,string
	push esi
	call cpy
	add esp,4

	mov esi,string
	push esi
	call pallindrome
	add esp,4

	mov esi,string2
	mov ecx,string1
	push esi
	push ecx
	call concate
	add esp,8

	ret
