import java.util.*;
import java.lang.Exception;

public class ArrayUtilDemo {

  public static void main(String[] args) {
    int[] list = {3, 2, 1, 3, 2};
    int[] nullList = null;
    int[] emptyList = {};
    
    System.out.println("Testing minValue");
    // Validates that the function returns min value
    try {
      System.out.println(ArrayUtils.minValue(list));
    } catch (BadArrayException e) {
      System.out.println(e);
    }
    
    // Validates that the function returns exception
    try {
      System.out.println(ArrayUtils.minValue(nullList));
    } catch (BadArrayException e) {
      System.out.println(e);
    }

    // Validates that the function returns list
    System.out.print("\n");
    System.out.println("Testing copyRange");
    try {
      int[] newList = ArrayUtils.copyRange(list, 2);
      for(int x = 0; x < newList.length; x += 1) {
          System.out.println(newList[x]);
      }
    } catch (BadArrayException e) {
      System.out.println(e);
    }
    
    // Validates that the method catches the empty array
    try {
      int[] newList = ArrayUtils.copyRange(nullList, 2);
      for(int x = 0; x < newList.length; x += 1) {
          System.out.println(newList[x]);
      }
    } catch (BadArrayException e) {
      System.out.println(e);
    }
  
    // Validates that the method catches the empty array
    try {
        ArrayUtils.copyRange(list, 9);
    } catch (BadArrayException e) {
        System.out.println(e);
    } catch (ArrayIndexOutOfBoundsException e) {
        System.out.println(e);
    }
    
    System.out.print("\n");
    System.out.println("Testing indexOf");
    // Validates that BadArrayException is returned when array is null
    try {
        ArrayUtils.indexOf(nullList, 3);
    } catch (BadArrayException e) {
        System.out.println(e);
    }
    
    // Validates that -1 is returned when param array's length is 0
    try {
        System.out.println(ArrayUtils.indexOf(emptyList, 3));
    } catch (BadArrayException e) {
        System.out.println(e);
    }
    
    // Validates that -1 is returned if searchValue is not in param array
    try {
        System.out.println(ArrayUtils.indexOf(list, 7));
    } catch (BadArrayException e) {
        System.out.println(e);
    }
    
    // Validates that the method will return the index of found searchValue
    try {
        System.out.println(ArrayUtils.indexOf(list, 3));
    } catch (BadArrayException e) {
        System.out.println(e);
    }
    
    
    System.out.print("\n");
    System.out.println("Testing lastIndexOf");
    // Validates
  }
}
