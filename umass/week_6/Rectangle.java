class Rectangle extends Shape {
    
    private double mLength = 0.00;
    private double mWidth = 0.00;
    
    public Rectangle(String color, double length, double width) {
        super(color);   
        mWidth = width;
        mLength = length;
    }
    
    public double area() {
        return mLength * mWidth;
    }
    
    public String toString() {
        return this.getColor() + " rectangle" + " with a length of " + Double.toString(mLength) + "and a width of "
        + Double.toString(mWidth) + " and an area of " + Double.toString(this.area());
    }
}