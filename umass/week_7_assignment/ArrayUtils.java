import java.util.*;
import java.lang.Exception;

public class ArrayUtils {

    // public methods
    public static int minValue(int[] list) throws BadArrayException {
        if (list == null || list.length == 0) {
            throw new BadArrayException("Array is empty!");
        } else {
            int min = list[0];
              for (int x: list) {
                  if (x < min) {
                     min = x;
                  }
             }
            return min;
        }
    }

    public static int[] copyRange(int[] list, int startIndex) throws
    ArrayIndexOutOfBoundsException, BadArrayException {
        
        // BadArrayException("Array is null")
        if (list == null || list.length == 0) {
          throw new BadArrayException("Array is empty!");
        }
        
        // check to make sure startIndex is between 0 and length of list
        // if it's outside, use the ArrayIndexOutOfBoundsException
        if (startIndex < 0 || startIndex >= list.length) {
          throw new ArrayIndexOutOfBoundsException();
        }

        //  create a new array with the length of list.length - startIndex
        int[] newList = new int[list.length - startIndex];


        // iterate over the list array starting at startIndex
        // add the first element to the array and all subsequent elements
        //     int[] list = {3, 2, 1, 3, 2};
        for(int x = startIndex, y = 0; x < list.length; x += 1, y += 1) {
            newList[y] = list[x];
        }

        // return new array
        return newList;
    }

    public static int indexOf(int[] list, int searchValue) throws BadArrayException {
        if(list == null) {
            throw new BadArrayException("Array is null");
        }
        
        if(list.length == 0) {
            return -1;
        }
        
        // search algorithm
        // input
        // int: searchValue, array of ints
        // output
        // returns index position if found, -1 if not
        
        // algorithm
        // take the array and iterate over it, if there is a match return index
        // if there isn't return -1
        
        for (int x = 0; x < list.length; x += 1) {
            if(list[x] == searchValue) {
                return x;
            }
        }
        return -1;
    }

    public static int lastIndexOf(int[] list, int searchValue) throws 
    BadArrayException {
        // input
        // int: searchValue, array: list
        // output
        // return index if found, -1 if not
        // rules
        // BadArrayException("Array is null") if param array is null
        // if param length is 0, return -1
        
        // algorithm
        // check if null
        // check if empty
        // iterate over array beginning at the end index position
        // list.length - 1
        // each iteration subtract 1 from the iterator
        // end once iterator >= 0
        
        if (list == null) {
            throw new BadArrayException("Array is null");
        }
        
        if (list.length == 0) {
            return -1;
        }
        
        for (int x = list.length - 1; x >= 0; x -= 1) {
            if (list[x] == searchValue) {
                return x;
            }
        }
        
        return -1;
    }


}
