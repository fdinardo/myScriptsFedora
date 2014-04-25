#include <stdio.h>
#include <stdlib.h>

int contaNome (char *nome);

int main ()
{
	int g1, g2, affinity, nNome, nNome2;
	char nome[20], nome2[20];
	printf("Inserisci il tuo nome: ");
	scanf("%s", nome);
	printf("Inserisci il nome della persona che ami: ");
	scanf("%s", nome2);
	printf("Inserisci il tuo anno di nascita: ");
	scanf("%d",& g1);
	printf("Inserisci il suo anno di nascita: ");
	scanf("%d", &g2);
	
	nNome=contaNome(nome);
	nNome2=contaNome(nome2);
	affinity = (int)(((nNome + g1) * (nNome2 + g2)) / 100);

	printf("###################################################################\n\n");
	printf("%s e %s hanno un'affinita' amorosa del %d% \n\n", nome, nome2, affinity);
	printf("###################################################################\n");
	printf("\nCreated by *FOXYWEB* M&F forever\n");

	return 0;
}

int contaNome(char *nome)
{
	int i;
	for(i=0; nome[i]!='\0'; i++);
		
	return i+1;
}
