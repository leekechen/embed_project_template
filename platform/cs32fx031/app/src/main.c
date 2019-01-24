#include <stdio.h>
#include "main.h"

int main(int argc, void** argv)
{
	printf("%s\n", STR_HELLO);
	printf("%s(),%d, Built at %s %s\n", __func__, __LINE__, __DATE__, __TIME__ );
	return 0;
}