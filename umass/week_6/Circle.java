class Circle extends Shape {
    
    // public static void main(String[] args) {
    //     Circle o = new Circle("red", 9.2);
    //     System.out.println(o.toString());
    // }
    
    private double mRadius = 0.00;
    
    public Circle(String color, double radius) {
        super(color);   
        mRadius = radius;
    }
    
    public double area() {
        return Math.PI * (mRadius * mRadius);
    }
    
    public String toString() {
        return this.getColor() + " circle" + " with a radius of " + Double.toString(mRadius) + " and an area of " + Double.toString(this.area());
    }
}