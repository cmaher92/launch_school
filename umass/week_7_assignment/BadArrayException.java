import java.lang.Exception;

public class BadArrayException extends Exception {
    public BadArrayException() {

    }

    public BadArrayException(String message) {
        super(message);
    }
}
