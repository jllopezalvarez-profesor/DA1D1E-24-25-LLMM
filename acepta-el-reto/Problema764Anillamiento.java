import java.util.Scanner;

public class Problema764Anillamiento {

    private static Scanner scanner = new Scanner(System.in);
    // private static Scanner scanner = new Scanner("2\n" + //
    // "4 0\n" + //
    // "3 3\n" + //
    // "3\n" + //
    // "10 0\n" + //
    // "20 3\n" + //
    // "4 0\n" + //
    // "0");

    public static void main(String[] args) {

        // int numCampanias = scanner.nextInt();
        // while(numCampanias !=0){
        // numCampanias = scanner.nextInt();
        // }

        int numCampanias;
        while ((numCampanias = scanner.nextInt()) > 0) {
            int totalAnillados = 0;
            while (numCampanias-- > 0) {
                int capturados = scanner.nextInt();
                int yaTenian = scanner.nextInt();
                totalAnillados += capturados - yaTenian;
            }
            System.out.println(totalAnillados);
        }
    }

}
