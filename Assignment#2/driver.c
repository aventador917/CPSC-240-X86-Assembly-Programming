#include <stdio.h>

extern long assignment2();

int main()
{
	printf("This is Assignment 2 programmed by your name\n");
	printf("I really like this open source programming.\n\n");
	long ret = assignment2();
	printf("\nThe main driver received this number: %ld\n", ret);
	printf("Next the main will return 0 to the operating system.\n");
	printf("Bye\n");
	return 0;
}
