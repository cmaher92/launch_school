import java.util.Scanner;
import java.io.*;

// Ask for input file name or 'keyboard', then open for reading
public class ReadFromInput {
    public static void main(String []args) {
        System.out.println("Enter input file name (or 'keyboard').");
        Scanner sc = new Scanner(System.in);
        String inName = sc.nextLine();
        
        // open the input file for reading
        Reader inReader = null;
        try {
             if (inName.equalsIgnoreCase("keyboard")) {
                 // Read from keyboard input
                 inReader = new InputStreamReader(System.in);  
             } else {
                 // Read from a file.
                 inReader = new FileReader(inName);
             }
         } catch(FileNotFoundException e) {
             // Unexpected, as already checked for file existing
             System.out.println("Unexpected error: " + e.toString());
             System.exit(1);
         } 
         inReader = new BufferedReader(inReader);
    }
}