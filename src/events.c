#include <stdio.h>

static char buffer[128];
static char length = 0;

char getchar() {
	char val = 0;
	if (length) {
		val = buffer[0];
		for (int i = 1; i < length; i++) {
			buffer[i - 1] = buffer[i];
		}
		length--;
	}
	return val;
}

void handleEvent(int type, int data) {
	if (type == 0) {
		if (length < 128) {
			buffer[length++] = data & 0xFF;
		}
	}
}
