import java.util.Scanner;

public class  Q05 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Digite os valores do IPCA por mês (Digite '*' para encerrar):");

        double menorIPCA = Double.MAX_VALUE;
        double maiorIPCA = Double.MIN_VALUE;
        double somaIPCA = 0;
        int quantidadeMeses = 0;
        String mesMenorIPCA = "";
        String mesMaiorIPCA = "";

        while (true) {
            System.out.print("Digite o mês e ano (MM/YYYY) seguido do IPCA (utilize vírgula para decimais): ");
            String entrada = scanner.nextLine().trim();
            if (entrada.equals("*")) {
                break;
            }

            String[] partes = entrada.split(" ");
            String mesAno = partes[0];
            double ipca = Double.parseDouble(partes[1].replace(',', '.'));

            if (ipca < menorIPCA) {
                menorIPCA = ipca;
                mesMenorIPCA = mesAno;
            }

            if (ipca > maiorIPCA) {
                maiorIPCA = ipca;
                mesMaiorIPCA = mesAno;
            }

            somaIPCA += ipca;
            quantidadeMeses++;
        }

        double mediaIPCA = somaIPCA / quantidadeMeses;

        System.out.printf("Menor IPCA: %.2f (%s)\n", menorIPCA, mesMenorIPCA);
        System.out.printf("Maior IPCA: %.2f (%s)\n", maiorIPCA, mesMaiorIPCA);
        System.out.printf("Média do IPCA: %.2f\n", mediaIPCA);
    }
}
