# variable scoping rules for instance variables, class variables, and constants
# how inheritance affects these rules

# instance variable scope
# - scoped at the object level

class Bottle
  def initialize(brand)
    @brand = brand # initialized at the object level
  end

  def whats_the_brand
    @brand # referencing an instance variable from another method
  end
end

bottle = Bottle.new('dasani')
bottle.whats_the_brand #=> "dasani"

# class variable scope
# - scoped at the class level
#   - all objects share 1 copy of the class variable
#   - class methods can access class variables, regardless of where it's initialized

class Person
  @@total_people = 0 # initialized at the class level

  def self.total_people
    @@total_people # accessible from class method
  end

  def initialize
    @@total_people += 1 # mutable from instance method
  end

  def total_people
    @@total_people # accessible from instance method
  end
end

Person.total_people # => 0

Person.new
Person.total_people # => 1

connor = Person.new
connor.total_people # => 2

# constant variable scope
#   - constants begin with capital letter and have lexical scope

class Desk
  TYPES = ['standing', 'standard', 'adjustable']

  attr_reader :type

  def self.types
    TYPES.join(', ')
  end

  def initialize
    @type = TYPES.sample
  end
end

Desk.types
my_desk = Desk.new
my_desk.type

# how sub-classing affects instance variables
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def dog_name
    "bark! bark! #{@name} bark! bark!" 
    # notice how @name instance variable can be referenced from descendant
  end
end

teddy = Dog.new('teddy')
puts teddy.dog_name # => bark! bark! teddy bark! bark!

# class variables and inheritance

class Plant
  @@total_plants = 0
  @@leaves = 10

  def initialize
    @@total_plants += 1
  end

  def self.leaves
    @@leaves
  end
end

class Rose < Plant
  @@leaves = 2
  def total_plants
    @@total_plants # note that class variables are accessible to sub-classes
  end
end

# above is a demonstration of how reassignment of a class variable cause unexpected
# results
puts Plant.leaves # => 2 # @@leaves is affected upon Rose's class definition
puts Rose.leaves  # => 2

# constants
module Maintenance
  def change_tires
    # "Changed #{WHEELS} tires." won't work because WHEELS' lexical scope is within Vehicle
    # remember lexical scope matters for constants
    "Changed #{Vehicle::WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end 

a_car = Car.new
a_car.change_tires

# Summary
# Instance Variables behave the way we'd expect. 
# The only thing to watch out for is to make sure the instance variable is 
# initialized before referencing it.

# Class Variables have a very insidious behavior of allowing sub-classes 
# to override super-class class variables. 
# Further, the change will affect all other sub-classes of the super-class. 
# This is extremely unintuitive behavior, forcing some Rubyists to eschew 
# using class variables altogether.

# Constants have lexical scope which makes their scope resolution rules 
# very unique compared to other variable types. 
# If Ruby doesn't find the constant using lexical scope,
# it'll then look at the inheritance hierarchy.

