class Rectangle {
    
    private double mWidth;
    private double mHeight;
    
// constructor
    public Rectangle(double width, double height)
      throws IllegalRectangleException
    {
      setSize(width, height);
    }

    public void setSize(double width, double height)
      throws IllegalRectangleException
    {
      // check for positivevalues
      if (width > 0.0)
        mWidth = width;
      else 
        throw new IllegalRectangleException("Rectangle: width must be positive: " + width);
      if (height > 0.0)
        mHeight = height;
      else
        throw new IllegalRectangleException("Rectangle: height must be positive: " + height);
    }

    public double area() {
        return mWidth * mHeight;
    }
}