import java.util.*;

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

        //  create a new array with the length of list.length - startIndex
        int[] newList = new int[list.length - startIndex];

        // check to make sure startIndex is between 0 and length of list
        // if it's outside, use the ArrayIndexOutOfBoundsException
        if (startIndex < 0 || startIndex >= list.length) {
          throw ArrayIndexOutOfBoundsException;
        }

        // BadArrayException("Array is null")
        if (list == null) {
          throw BadArrayException("Array is null");
        }

        // iterate over the list array starting at startIndex
        // add the first element to the array and all subsequent elements
        for (int x = startIndex, int y = 0; x < list.length; x += 1, y += 1) {
            newList[y] = list[x];
        }

        // return new array
        return newList;
    }

    // public static int indexOf(int[] list, int searchValue) {
        // searchces its parameter array to locat the first occurence of the perameter searchValue
        // return
        // index position if found, or -1 if not found
        // rules
        // if array parameter is null, throw BadArrayException with the message "array is full"
        // if array parameter is length 0, it must return -1
        // must not alter the array parameter contents, nor copy the entire array contents to another array
        // only can search through the array once
        // doesn't read or print anything
        // must use search and copy logic for the above methods
    // }

    // public static int lastIndexOf(int[] list, int searchValue) {
        // searches its parameter array to locate the last occurance of the searchValue
        // returns its index position if found, -1 if not
        // rules
        // BadArrayException("Array is null")
        // if param length is 0, return -1
        // must not alter the array param contents
        // only can search once
    // }


}
