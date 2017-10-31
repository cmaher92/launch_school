public class RectangleDemo {
    
    public static void main(String[] args) {
        try {
         Rectangle r = new Rectangle(10, 11);   
        } catch (IllegalRectangleException e) {
            e.printStackTrace();
        }
    }
}