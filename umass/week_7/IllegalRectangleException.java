import java.lang.Exception;

public class IllegalRectangleException extends Exception {
    public IllegalRectangleException(String error) {
        super(error);
    }
}