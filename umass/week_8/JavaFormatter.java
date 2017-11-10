import java.io.*;
import java.util.Scanner;

public class JavaFormatter {
    // read words from an input file and write them to an output file
    // removes extra whitespace
    // will fit up to a maximum column width
    int columnWidth;
    File inputs;

    public JavaFormatter() {
      this.columnWidth = retrieveColumnWidth();
      this.inputs      = retrieveInputFile();

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
    private int retrieveColumnWidth() {
      System.out.println("How wide should the column width be?");
      System.out.println("Please choose between 30 and 100");
      Scanner scanner = new Scanner(System.in);
      int columnWidth = scanner.nextInt();
      scanner.close();
      return columnWidth;
    }

    private File retrieveInputFile() {
      System.out.println("What is the name of the file you wish to format?");
      Scanner sc = new Scanner(System.in);
      String fileName = sc.nextLine();
      boolean fileExists = false;
        while (!fileExists) {
          try {
              File file = new File(fileName);
              fileExists = file.isFile();
              return file;
          } catch (NullPointerException e) {
              System.out.println("File exists already");
          }
        }
      sc.close();
    }

}
