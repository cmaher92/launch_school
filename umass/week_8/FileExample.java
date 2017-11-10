import java.io.*;
import java.util.Scanner;

public class FileExample {
    public static void main(String []args) {
//     try {
// 	     File file = new File("outputs.txt");
// 	     /*If file gets created then the createNewFile()
// 	      * method would return true or if the file is
// 	      * already present it would return false
// 	      */
//          boolean fvar = file.createNewFile();
// 	     if (fvar){
// 	          System.out.println("File has been created successfully");
// 	     }
// 	     else{
// 	          System.out.println("File already present at the specified location");
// 	     }
//     	} catch (IOException e) {
//     		System.out.println("Exception Occurred:");
// 	        e.printStackTrace();
// 	  }
	  try {
	      File inputs = new File("inputs.txt");
	      boolean isCreated = inputs.createNewFile(); // returns boolean



	      // Checks to see if the file is created
	      if (isCreated) {
	          System.out.println("The file has been created");
	      } else {
	          System.out.println("The file was already created prior");
	      }

	      // Constructs a new Scanner that produces values scanned from
	      // the specified file.
	      Scanner scanner = new Scanner(inputs);

	      File outputs = new File("outputs.txt");
	      PrintWriter printWriter = new PrintWriter(outputs);
	      printWriter.println("testing");

	      // while the scanner has more lines
	      while(scanner.hasNextLine()) {
	          // the nextLine() method returns the current token and advances
	          // to the next token
	          System.out.println(scanner.nextLine());
	      }
	      // close to avoid memory leak
	      scanner.close();
	  } catch (FileNotFoundException e) {
	      System.out.println("Error reading file");
	      e.printStackTrace();
	  }

    }
}
