import java.util.Scanner;

public class Q03 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Quantidade de jogos vendidos este mês:");
        int quantidadeJogos = scanner.nextInt();

        double valorTotalVendas = quantidadeJogos * 19.90;

        double bonus = (quantidadeJogos/15) * (0.08 * valorTotalVendas);

        double salario = (0.5 * valorTotalVendas) + bonus;

        System.out.printf("%.2f\n", valorTotalVendas);
        System.out.printf("%.2f\n", bonus);
        System.out.printf("%.2f\n", salario);
    }
}
