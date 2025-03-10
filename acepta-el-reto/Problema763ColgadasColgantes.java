import java.util.Scanner;

public class Problema763ColgadasColgantes {

    private static Scanner scanner = new Scanner(System.in);
    // private static Scanner scanner = new Scanner("3\n" + //
    // "colgadas\n" + //
    // "COLGANTES\n" + //
    // "ColgadaS");

    public static void main(String[] args) {
        int numCasos = Integer.parseInt(scanner.nextLine());

        while (numCasos-- > 0) {
            String palabra = scanner.nextLine();

            System.out.println(palabra.equalsIgnoreCase("colgadas") ? "Bien" : "Mal");

        }
    }

}
