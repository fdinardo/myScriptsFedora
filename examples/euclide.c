/**
Calcolo del massimo comun divisore con il teorema di Euclide:
Per tutti gli interi a >= 0 e b > 0 il gcd fra a e b è 
 gcd(a,b) = gcd(b,a mod b)
Ovvero che essendo a maggiore o uguale a 0 e b maggiore di 0 il calcodo del gcd si può
effettuare ricorsivamente sul modulo di a su b (a mod b), passando come primo argomento 
della funzione il numero b e come secondo il loro modulo. 
Se b diventa uguale a 0 (durante le chiamate ricorsive a diventa b e viceversa) allora il massimo comun diivisore è a.
**/

#include<stdio.h>

int euclide (int a, int b);

int main (void)
{
	int num1, num2;
	printf("Calcolo del massimo comun divisore fra due numeri interi\n");
	printf("Primo numero: ");
	scanf("%d", &num1);
	printf("Secondo numero: ");
	scanf("%d", &num2);
	printf("Il massimo comun divisore fra %d e %d è: %d\n", num1, num2, euclide(num1,num2));
	return 0;
}

int euclide (int a, int b)
{
	if (b == 0) 
		return a;
	else 
		return euclide(b, a % b);
}
