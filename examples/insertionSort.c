#include<stdio.h>
#include<stdlib.h>
#define MAX 10000

void init (int *A);

int main (void) {
	
	srand(time(NULL));
	
	int i,j,key;
	int A[MAX];
	init (A); 
	
	for (j=0; j<MAX; j++)
                printf("%d | ",A[j]);
        printf("\n\nOrdinamento decrescente\n");


	for (j=1; j<MAX; j++){
		key=A[j];
		i=j-1;
		while (i>=0 && A[i] < key){
			A[i+1]=A[i];
			i--;
		}
		A[i+1] = key;
	}
	
	for (j=0; j<MAX; j++)
		printf("%d | ",A[j]);
	printf("\n");

	return 0;
}

void init(int *A){
	int i;
	for (i=0; i<MAX; i++)
		A[i]= (rand() % 20000) - 10000;
	return; 
}
