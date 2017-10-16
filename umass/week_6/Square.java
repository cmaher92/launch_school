class Square extends Shape {
    
    private double mSideLength = 0.00;
    
    public Square(String color, double sideLength) {
        super(color);   
        mSideLength = sideLength;
    }
    
    public double area() {
        return mSideLength * mSideLength;
    }
    
    public String toString() {
        return this.getColor() + " square" + " with a side length of " + Double.toString(mSideLength) + " and an area of " + Double.toString(this.area());
    }
}