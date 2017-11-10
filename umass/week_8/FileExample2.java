// Check creating a file with and without try/catch
import java.io.*;
import java.util.*;


public class FileExample2 {
  public static void main(String []args) {

      // Ask for output file name, or 'console', then open it.
    System.out.println("Enter output file name or 'console'.");
    Scanner scanner = new Scanner(System.in);
    String outName = scanner.nextLine();
    PrintWriter outWriter = null;
    try {
        if (outName.equalsIgnoreCase("console")) {
            // Write to console display.
            outWriter = new PrintWriter(System.out);
        } else {
            // Write to a file.
            outWriter = new PrintWriter(new BufferedWriter(new FileWriter(outName)));
        }
    } catch (IOException e) {
        System.out.println(e.toString());
        System.exit(1);
    }

    // Write output to specified file or console display.
    outWriter.println("Hi Mom!");

  }
}
