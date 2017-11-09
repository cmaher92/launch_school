import java.io.*;

public class PrintWriterExample {
    public static void main(String []args) {
        File file = new File("outputs.txt");
        try {
            PrintWriter printWriter = new PrintWriter(file);  
            printWriter.print("test test test");
            printWriter.close();
        } catch (FileNotFoundException e) {
            System.out.println(e);
        }
    }
}