#include <stdio.h>

extern int assignment1();

int main()
{
	printf("Welcome to Open source Assembly Programming\n");
	int ret = assignment1();
	printf("The main function received this number: %d\n", ret);
	printf("Main will now return 0 to the operating system.\n");
	printf("Bye\n");
	return 0;
}
