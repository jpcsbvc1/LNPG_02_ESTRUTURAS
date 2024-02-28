#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_PARTICIPANTES 100
#define NUM_QUESTOES 10

int main() {
    int gabarito[NUM_QUESTOES];
    int notas[MAX_PARTICIPANTES];
    char nomes[MAX_PARTICIPANTES][50];
    int contadorMaisDaMetade = 0;
    int melhorPontuacao = 0;
    int piorPontuacao = NUM_QUESTOES;

    printf("Insira as respostas do gabarito:\n");

    for (int i = 0; i < NUM_QUESTOES; i++) {
        scanf("%d", &gabarito[i]);
    }

    printf("Agora insira as respostas dos participantes:\n");

    int numParticipantes = 0;
    while (1) {
        printf("Nome do participante (ou '*' para terminar):\n");
        scanf("%s", nomes[numParticipantes]);
        if (strcmp(nomes[numParticipantes], "*") == 0) {
            break;
        }

        int nota = 0;
        for (int i = 0; i < NUM_QUESTOES; i++) {
            printf("Resposta do participante para a questão %d:\n", i+1);
            int resposta;
            scanf("%d", &resposta);
            if (gabarito[i] == resposta) {
                nota++;
            }
        }
        notas[numParticipantes] = nota;
        numParticipantes++;

        if (nota >= NUM_QUESTOES / 2) {
            contadorMaisDaMetade++;
        }

        if (nota > melhorPontuacao) {
            melhorPontuacao = nota;
        }

        if (nota < piorPontuacao) {
            piorPontuacao = nota;
        }
    }

    printf("a) Lista de participantes e suas notas em ordem alfabética:\n");
    for (int i = 0; i < numParticipantes; i++) {
        printf("%s: %d\n", nomes[i], notas[i]);
    }

    printf("\nb) Melhor e pior pontuação:\n");
    printf("Melhor pontuação: %d\n", melhorPontuacao);
    printf("Pior pontuação: %d\n", piorPontuacao);

    printf("Participante(s) com a melhor pontuação:\n");
    for (int i = 0; i < numParticipantes; i++) {
        if (notas[i] == melhorPontuacao) {
            printf("%s\n", nomes[i]);
        }
    }

    printf("Participante(s) com a pior pontuação:\n");
    for (int i = 0; i < numParticipantes; i++) {
        if (notas[i] == piorPontuacao) {
            printf("%s\n", nomes[i]);
        }
    }

    printf("\nc) Percentual de participantes com mais da metade das questões certas:\n");
    double percentual = (double) contadorMaisDaMetade / numParticipantes * 100;
    printf("%.1f%% dos participantes têm mais da metade das questões certas.\n", percentual);

    return 0;
}
