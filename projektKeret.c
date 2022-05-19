#include <stdio.h>

void array_sort(int array[], int length);

int main() {
	int array[] = {1, -3, 4, -2, 5, 9, -7, 8, 6, 0};
	int length = 10;
	
	array_sort(array, length);
	
	printf("Elso elem: %d\n", array[0]);
	
	// Teljes tömb
	/*
	for (int i = 0; i < length - 1; i++) {
		printf("%d, ", array[i]);
	}
	printf("%d\n", array[length - 1]);
	*/
	
	return 0;
}
