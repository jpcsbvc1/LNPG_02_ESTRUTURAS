import java.util.Scanner;

public class Q01 {


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Quantidade de passageiros:");
        int N = scanner.nextInt();

        for (int i = 0; i < N; i++) {
            System.out.println("Você possui RG?");
            String possuiRG = scanner.next();
            System.out.println("Qual sua data de nascimento no RG?");
            String dataNascimentoRG = scanner.next();
            System.out.println("Você possui passagem?");
            String possuiPassagem = scanner.next();
            System.out.println("E a data de nascimento na passagem?");
            String dataNascimentoPassagem = scanner.next();
            System.out.println("Qual o seu assento?");
            String assento = scanner.next();

            if (possuiRG.equals("Nao")) {
                System.out.println("a saída é nessa direção");
            } else if (possuiPassagem.equals("Nao")) {
                System.out.println("a recepção é nessa direção");
            } else if (!dataNascimentoRG.equals(dataNascimentoPassagem)) {
                System.out.println("Infelizmente, terei que chamar a polícia.");
            } else {
                System.out.println("o seu assento é " + assento + " tenha um ótimo dia");
            }
        }
    }
}

