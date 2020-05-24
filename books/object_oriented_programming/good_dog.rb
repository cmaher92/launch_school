class Animal
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end

  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  DOG_YEARS = 7
  attr_accessor :color, :age

  def initialize(name, color, age)
    super(name)
    @color = color
    @age = age
  end

  def speak
    super + " from GoodDog class"
  end

  private 
  # anything below this is private, unless protected is called and negates it
  # only accessible from other methods in the class

  def human_years
    age * DOG_YEARS
  end
end

class Cat < Animal
end

sparky = GoodDog.new('sparky', 'brown')
puts sparky.speak
p GoodDog.ancestors
