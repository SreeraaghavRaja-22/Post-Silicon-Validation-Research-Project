// Test program to verify that the RAW Hazard detection works

#include <stdio.h>

int main(){
	// using volatile prevents the compiler from optimizing these operations out
	volatile int a = 2; 
	volatile int b = 3; 
	volatile int c = 4; 
	volatile int d = 5; 

	printf("Starting tight RAW hazard loop...\n");

	for(int i = 0; i < 10000; ++i){
		// each instruction relies strictly on the result of the immediate predecessor
		a = b + c; // write A
		b = a + b; // RAW Hazard
		c = d + a; // RAW Hazard
		b = c + d; // RAW Hazard
	}

	printf("Finished! b = %d\n", b);
	return 0;
}
