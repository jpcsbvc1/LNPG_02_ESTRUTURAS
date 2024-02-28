import java.util.*;

public class Q04{

    public static void main(String[] args) {
        System.out.println("Insira as respostas do gabarito:");
        Scanner scanner = new Scanner(System.in);

        int[] gabarito = new int[10];
        for (int i = 0; i < 10; i++) {
            gabarito[i] = scanner.nextInt();
        }

        System.out.println("Agora insira as respostas dos participantes:");
        Map<String, Integer> notas = new HashMap<>();

        while (true) {
            System.out.println("Nome do participante (ou '*' para terminar):");
            String nome = scanner.next();
            if (nome.equals("*")) {
                break;
            }
            int nota = 0;
            for (int i = 0; i < 10; i++) {
                System.out.println("Resposta do participante para a questão " + (i+1) + ":");
                int resposta = scanner.nextInt();
                if (gabarito[i] == resposta) {
                    nota++;
                }
            }
            notas.put(nome, nota);
        }

        System.out.println("a) Lista de participantes e suas notas em ordem alfabética:");
        TreeMap<String, Integer> notasOrdenadas = new TreeMap<>(notas);
        for (Map.Entry<String, Integer> entry : notasOrdenadas.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }

        System.out.println("\nb) Melhor e pior pontuação:");
        int melhorPontuacao = Collections.max(notas.values());
        int piorPontuacao = Collections.min(notas.values());
        System.out.println("Melhor pontuação: " + melhorPontuacao);
        System.out.println("Pior pontuação: " + piorPontuacao);
        System.out.println("Participante(s) com a melhor pontuação:");
        for (Map.Entry<String, Integer> entry : notas.entrySet()) {
            if (entry.getValue() == melhorPontuacao) {
                System.out.println(entry.getKey());
            }
        }
        System.out.println("Participante(s) com a pior pontuação:");
        for (Map.Entry<String, Integer> entry : notas.entrySet()) {
            if (entry.getValue() == piorPontuacao) {
                System.out.println(entry.getKey());
            }
        }

        System.out.println("\nc) Percentual de participantes com mais da metade das questões certas:");
        int contadorMaisDaMetade = 0;
        for (int nota : notas.values()) {
            if (nota >= 5) {
                contadorMaisDaMetade++;
            }
        }
        double percentual = (double) contadorMaisDaMetade / notas.size() * 100;
        System.out.printf("%.1f%% dos participantes têm mais da metade das questões certas.\n", percentual);
    }
}
