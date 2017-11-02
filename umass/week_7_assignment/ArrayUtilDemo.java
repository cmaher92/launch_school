public class ArrayUtilDemo {
    
    public static void main(String[] args) 
    {
        int[] list = {3, 2, 1, 3, 2};
       
        try {
        ArrayUtils.minValue(list);
        
        } catch (BadArrayException e) {
            System.out.println(e);
        }
        
        ArrayUtils.copyRange(list, 3);
    }
}   