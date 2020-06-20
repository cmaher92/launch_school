class Person
  attr_accessor :name, :age
  
  def initialize(name, age)
    @name = name
    @age    = age
  end
  
  def >(other)
    # note we are pushing the comparison functionality to the Integer#> method
    age > other.age
  end

end

connor = Person.new('connor', 28)
skylar  = Person.new('skylar', 22)

puts "connor is older than skylar" if connor > skylar