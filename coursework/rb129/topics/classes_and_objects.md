# Classes & Objects

## Sources

[Launch School - Lecture - Classes and Objects](https://launchschool.com/lessons/dfff5f6b/assignments/209fc900)

[Launch School - Exercises -Classes and Objects](https://launchschool.com/lessons/dfff5f6b/assignments/bc346833)

[Launch School - OOP Book](https://launchschool.com/books/oo_ruby/read/the_object_model)

[UTexas - OOP Lecture](https://www.cs.utexas.edu/~mitra/csSpring2017/cs303/lectures/oop.html)

---

## Terminology

| Term             | Definition                                                   |
| ---------------- | ------------------------------------------------------------ |
| *to* instantiate | *to* create an object (a location of memory that has a value) |
| attribute        | a specification that defines a property of an object and help distinguish from other objects |
| behavior         | determined by what objects are capable of doing              |
| method           | an action that can be invoked from any object of the class to *affect behavior* |
| instance         | a single occurrence of an object                             |
| state            | determined by the values of an instance's attributes, the particular condition that an object is in at a specific point in time |



## Notes

### Classes

A class is a description of a group of objects with common attributes, behaviors, and relationships. A class is a blueprint that *describes the state* and *behavior* that the objects of the class all share.

When defining a class there are *two main focuses*:

* States, defined with instance variables.
* Behaviors, what objects are capable of doing.


Classes are defined in ruby like this:

```ruby
class Dog
  def initialize(breed)
    @breed = breed
  end
  
  def swim
    # definition of the Dog classes swim behavior which can expose information about the Dog's state
  end
end
```

Classes are initialized like this:

```ruby
dog = Dog.new('yellow lab')
```

*An instance of the `Dog` class is instantiated*:

* The `new` class method is invoked and passed the `'yellow lab'` string literal
* The invocation of the `new` method leads to the invocation of the `initialize` method which sets the state of the object's breed
* The `initialize` method is a constructor method, which is responsible for setting the initial state of an object. 
  * A String literal `'yellow lab'` is passed as an argument to the constructor method `initialize` upon the instantiation of the object with `Dog.new('yellow lab'`. 
* The newly instantiated `Dog` object is returned and assigned to the `dog` local variable



As mentioned before classes are the blueprints or molds that will be used to describe the states and behaviors that the objects will all share. These blueprints and molds aren't created from scratch though and because they all inherit some behaviors and state from classes higher up the object hierarchy, like from `BasicObject`. 



An instance variable is defined in a class and each object/instance of that class will have a distinct copy.

### Objects

An object is a concept, abstraction, or thing with boundaries and meaning. 

Objects are created from classes. Think of classes as molds and objects as the things produced from those molds. 

```ruby
# this is the class or mold in reference to the analogy
class Car
  def initialize
    @color
    @type
  end
end

# this is the instance or things produced from the class/mold
car = Car.new
```



Individual objects will contain distinct information from other objects, yet they are instances of the same class.

```ruby
'hello'.class # => String
'bye'.class   # => String
```



Anything in Ruby that has a value is an object. 

