import java.util.Scanner;
import java.io.*;

public class WriteToConsole {
  public static void main(String []args) {
    System.out.println("Enter output file name or 'console'.");
    Scanner sc = new Scanner(System.in);
    String outName = sc.nextLine();
    
    PrintWriter outWriter = null;
    try {
      if (outName.equalsIgnoreCase("console")) {
        // Write to console display.
        outWriter = new PrintWriter(System.out);
      } else {
        // Write to file
        outWriter = new PrintWriter(new BufferedWriter(new FileWriter(outName)));
      }
    } catch(IOException e) {
      System.out.println(e.toString());
      System.exit(1);
    }
    
    outWriter.println("Hi mom");
  }   
}