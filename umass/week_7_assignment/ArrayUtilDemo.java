public class ArrayUtilDemo {

    public static void main(String[] args)
    {
        int[] list = {3, 2, 1, 3, 2};
        int[] list = null;

      //  Validates that the function returns min value
        try {
        ArrayUtils.minValue(list);

        } catch (BadArrayException e) {
            System.out.println(e);
        }


        try {
          ArrayUtils.copyRange(list, 3);
        } catch
    }
}

public class ArrayUtilDemo {

  public static void main(String[] args) {
    int[] list = {3, 2, 1, 3, 2};
    int[] nullList = null;

    // Validates that the function returns min value
    try {
      ArrayUtils.minValue(list);
    } catch (BadArrayException e) {
      System.out.println(e);
    }

    // Validates that the function works properly
    try {
      ArrayUtils.copyRange(list, 3);
    } catch (BadArrayException e) {
      System.out.println(e);
    } catch (ArrayIndexOutOfBoundsException) {
      System.out.println("woops");
    }
  }

}
