import java.util.Scanner;

public class Q02 {


    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite um número inteiro: ");
        int n = scanner.nextInt();

        double S = 0;
        for (int i = 0; i < n; i++) {
            S += Math.pow(-1, i) / (2 * i + 1.0);
        }

        double pi = Math.cbrt(S * 32);

        System.out.printf("O valor de pi é: %.5f\n", pi);
    }
}
