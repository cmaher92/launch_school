import java.util.*;
import java.lang.Exception;

public class ArrayUtilDemo {

  public static void main(String[] args) {
    int[] list = {3, 2, 1, 3, 2};
    int[] nullList = null;
    
    System.out.println("Testing minValue");
    // Validates that the function returns min value
    try {
      System.out.println(ArrayUtils.minValue(list));
    } catch (BadArrayException e) {
      System.out.println(e);
    }

    // Validates that the function returns list
    System.out.println("Testing copyRange");
    try {
      int[] newList = ArrayUtils.copyRange(list, 2);
      for(int x = 0; x < newList.length; x += 1) {
          System.out.println(newList[x]);
      }
    } catch (BadArrayException e) {
      System.out.println(e);
    } 
  }

}
