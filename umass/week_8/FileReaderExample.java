import java.io.*;

public class FileReaderExample {
    public static void main(String []args) {
        Reader fileReader = new FileReader("/home/ubuntu/workspace/umass/week_8/outputs.txt");
        
        int data = fileReader.read();
        while(data != -1) {
            System.out.println(data);
            data = fileReader.read();
        }
        fileReader.close();
    }
}