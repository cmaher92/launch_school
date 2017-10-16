// understanding the problem
// input
//  int, array: the int is the size and the array is the items
// output
//  print unsorted values
//  print sorted values

import java.util.Scanner;

public class ArraySort {
 public static void main(String[] args) {
  int length = 0;
  // loop until size of array is within 3 and 10
  while (length < 3 || length > 10)
    {
    // prompts for the size of the array (between 3 and 10)
    System.out.println("Please enter the size of the array to be created");
    System.out.println("(Must be between 3 and 10)");
    Scanner sc = new Scanner(System.in);
    length = sc.nextInt();
    }
  
  // dynamically creates int array of the requested size
  int [] array = new int[length];
  
  // calls fillArray method to read values into the array
  fillArray(array);
  System.out.println("The unsorted values...");
  printArray(array);
  sortArray(array);
  System.out.println("The sorted values...");
  printArray(array);
 } 
 
 public static void fillArray(int[] array) {
 // create local scanner object
  Scanner sc = new Scanner(System.in);
  
  // loops once for each array element
  for(int x=0; x < array.length; ++x) {
    System.out.println("please enter a value for element " + x);
    int num = sc.nextInt();
    array[x] = num;

  }
 }
 
 public static void printArray(int[] array) {
   for(int x: array) {
    System.out.println(x);
  }
 }
 
 public static void sortArray(int[] array) {
   boolean swapped = false;
   do {
    // iterates over the array until there are no more swaps made
     swapped = false;
      for (int x=0; x+1 < array.length; x++) {
        // if the current item bigger than the next item?
        if (array[x] > array[x+1]) {
          // swap current item for the next item
          int temp = array[x];
          array[x] = array[x+1];
          array[x+1] = temp;
          swapped = true;
        }
        }
    }while (swapped);
     
   }
   
   
}