import java.io.*;
import java.util.Scanner;
import java.io.PrintWriter;

public class JavaFormatter {
    // read words from an input file and write them to an output file
    // removes extra whitespace
    // will fit up to a maximum column width
    int columnWidth;
    File inputs;

    public JavaFormatter() {
      // this.columnWidth = retrieveColumnWidth();
      // this.inputs      = retrieveInputFile();
      System.out.println("How wide should the column width be?");
      System.out.println("Please choose between 30 and 100");
      Scanner scanner = new Scanner(System.in);
      this.columnWidth = scanner.nextInt();

      // - Ask for the file
      // - If so, open for reading
      boolean fileExists = false;
      File file = null;
      while (fileExists == false) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Please enter the name of the file to be formatted:");
        String line = sc.nextLine();
        file = new File(line);
        fileExists = file.exists();
        if (fileExists == false) {
          System.out.println("This file does not exist, please enter a valid file name");
        }
      }
      // open the file for reading using the scanner class
      Scanner scannedInputFile = null;
      try {
        scannedInputFile = new Scanner(file);
      } catch (FileNotFoundException e) {
        System.out.println("The file does not exist: " + e);
      }

      // Prompt for the file name of the output file
      boolean outputExists = false;
      File outputFile = null;
      PrintWriter pw = null;
      while (outputExists == false) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Please enter the name of the file to output:");
        String newFileName = scan.nextLine();
        outputFile = new File(newFileName);
        outputExists = outputFile.exists();

        if (outputExists) { // Ask to overwrite existing file
          System.out.println("Is it ok to overwrite the file? Y/N");
          Scanner overwriteScan = new Scanner(System.in);
          String writable = overwriteScan.nextLine();

          if (writable == "N") {
            System.out.println("Please choose a file that you can overwrite");
            break;
          }

          try {
            pw = new PrintWriter(outputFile);
          } catch (FileNotFoundException e) {
            System.out.println(e);
          }

        } else { // Create new file
          try {
          outputFile.createNewFile();
          pw = new PrintWriter(outputFile);
          outputExists = true;
        } catch (IOException e) {
          System.out.println(e);
        }
        }
      }

      // Write a line of * chars the length of columnWidth
      String stars = "";
      for (int x =0; x < columnWidth; x+=1) {
          stars = stars + "*";
      }
      pw.print(stars);
      // pw.print(stars);
      // System.out.println(error);

      String formattedLine = "";
      String currentToken = "";
      while (scannedInputFile.hasNext()) {
        currentToken = scannedInputFile.next();
        if (formattedLine.length() + currentToken.length() >= columnwidth) {
          pw.print(formattedLine);
        } else {
          formattedLine = formattedLine + " " + currentToken;
        }
      }
      pw.print(formattedLine);
      pw.close();
    }

    public static void main(String []args) {
      JavaFormatter format = new JavaFormatter();
      // prompt for file, test that file exists and can be read
    // Use a file object to test that the file exists and can be read
    // If so, open the file for reading using the Scanner class
    // Use a do-while loop to repeat these steps until a valid input file is entered

    // prompt for the file name of the output file is to write the formatted words to
    // Use a File object to test that the file doesn't already exist
    // if it exists, prompt to check for overwriting the file
    // open the file for writing using a PrintWriter
    // use a do-while loopto repeat these steps until a valid output file is entered

    // Write a line of * characters the width of the formatted output as a
    // heading in the output file
    // no formatted output line should be longer than this heading line

    // loop, reading words (text between whitespace) from the input file using
    // Scanner.next(), appending them to a line of text being formatted
    // If so write the line to the output file, reset it to contain just the
    // new word and continue reading until end of file is encountered
    // using Scanner.hasNext()
    // Do not read entire file into memory, do not hold multiple lines at once
    // at the end of input close the PrintWriter to flush any buffered output
    // to the file
    }

    // retrieve the columnWidth from user
    // private int retrieveColumnWidth() {
    // }

    // private File retrieveInputFile() {
    // }

}
