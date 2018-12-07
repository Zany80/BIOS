#include <stdio.h>
#include <stdbool.h>
#include <system.h>

void main() {
	serialWrite("Hello, world!");
	while (true)
		halt();
}
