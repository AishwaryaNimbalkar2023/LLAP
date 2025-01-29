#include<stdio.h>
int main()
{
	char input[30] = {"this is text message.\n"};
	char output[30];
	int length=25;
	asm volatile("cld\n\t"
			"rep movsb"
			:
			:"S" (input) ,"D" (output),"c" (length));
			printf("%s",output);
			return 0;
}

