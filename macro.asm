%macro abc 2
	mov eax,%1
	add eax,%2
%endmacro
	section.text
	global main
main: 
	abc 10,20
	abc -20,-50
	ret
