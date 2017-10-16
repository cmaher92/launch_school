class Shape {
  
  private String mColor = null;
  
  public Shape(String color) { //ctr method
    mColor = color;
  }
  
  public String getColor() {
    return mColor;
  }
  
  public double area() {
    return 0.0;
  }
  
  public String toString() {
    return "generic shape";
  }
  
}