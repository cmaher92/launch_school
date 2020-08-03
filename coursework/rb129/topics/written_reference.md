# Written Reference

[TOC]

## Classes and objects

### Class

* Classes define Objects
* Ruby defines the attributes and behaviors of its objects in classes
  * classes define behaviors, what objects are capable of doing, using instance methods
* Classes are a basic outline of what an object should be made of and what it should do

#### Class variables

* creating using two `@@` symbols
* can be accessed within instance method

#### Constants

* used for variables that should never be changed
* lexically scoped
* defined by using an uppercase letter, however most rubyists uppercase entire variable
* can be reassigned but will throw a warning

### Object

* Objects are instantiated from classes. 
* Individual instances contain different information from other objects, yet are instances of the same class.
* Every object's state is unique

```ruby
# An example of two objects of the String class
'hello'.class # => String
'world'.class # => String
```

> 'hello' is an instance of the String class
>
> 'world' is also an instance of the String class

#### Instance variable

* scoped at the object/instance level
* keep track of state
* Exist as long as the object instance exists until the object is destroyed

#### Instance method

* used to expose information about the state of an object

####  Instantiation

The entire workflow of creating an new object/instance from a class is called instantiation.

```ruby
class GoodCat
  def initialize(name)
    @name = name
  end
end

mila = GoodCat.new("Mila")
```

*Here the string "Mila" is being passed from the `new` class method through to the `initialize` method, and is assigned to the local variable `name`. Within the constructor method `initialize` the instance variable `@name` is set to the value of `name` resulting in "Mila" being assigned to the `@name` instance variable.*

#### Initialization

* The `initialize` method gets called every time you create a new object/instance
* `initialize` is a constructor method triggered by the `::new` class method

#### Getter and Setter methods

* As convention, Rubyists typically want to name those *getter* and *setter* methods using the same name as the instance variable they are exposing and setting

* can be referred to as accessor methods

* Instead of referencing the instance variable directly, invoke the getter/setter method 

  ```ruby
  def speak
    "#{name} says arf!"
  end
  ```

  * This is done so when you reference the attribute you do so in a uniform manner

	  ```ruby
    def name
      @name.upcase
  end
    
    def speak
      "#{@name.upcase}" # if you just reference the name you wont have to keep manipulating the attribute
    end
    ```
  

##### Defining Getter methods

* Used to expose attributes

```ruby
class GoodCat
  def initialize(name)
    @name = name
  end
  
  def name
    @name
  end
end

GoodCat.new('Mila').name
```

*Here the getter method `name` is invoked returning the `@name` attribute*

##### Defining Setter methods

* Used to set attributes
* Ruby gives special syntax to use it `mila.name=('Milo')` can be used as `mila.name = 'Milo'`

```ruby
class GoodCat
  def initialize(name)
    @name = name
  end
  
  def name
    @name
  end
  
  def name=(name)
    @name = name
  end
end

mila = GoodCat.new('Mila')
mila.name = 'Milo'
mila.name # => Milo
```

*Here the setter method `name=` is invoked which changes the `@name` attribute for the `mila` instance*



## Use `attr_*` to create setter and getter methods

Writing *getter* and *setter* methods takes up a lot of room, so Ruby provided a built-in way to create *getter* and *setter* methods, by way of `attr_*` methods

### attr_accessor

* takes symbol as argument which is used to create the method name for the getter and setter methods

### attr_reader

* only allows you to retrieve the instance variable (or expose the attribute in other words)

### attr_writer

* only allows you to set the instance variable (or to set the attribute)



## How to call setters and getters

### Getters

* Whenever referencing an attribute from within the class, reference the getter method instead of the instance variable directly

```ruby
  def speak
    "#{name} says hi!"
  end
```

* Because setters use `self` to disambiguate from creating a local variable, we should use `self` to reference getters although it is not required

```ruby
def speak
  "#{self.name} says hi!"
end
```



### Setters

* Whenever setting an attribute from within the class, use the setter method instead of the instance variable directly

```ruby
attr_accessor :name, :weight, :height
def change_info(n, w, h)
  self.name = n
  self.weight = w
  self.height = h
end
```

*Be careful of trying to call the method without `self` because Ruby will think it's a local variable*

## Instance methods vs. class methods

### Instance methods

* methods that pertain to an instance or object of a class

#### to_s method

* by default returns the name of the object's class and an encoding of the object id
* automatically called in string interpolation

### Class methods

* class level methods, called class methods
* methods we can call directly on the class itself, without needing to instantiate any objects
* **class methods are where we put functionality that does not pertain to individual objects**

#### Defining a class method

```ruby
def self.what_am_i
  "I'm a GoodCat class!"
end
```



#### Invoking a class method

```ruby
GoodCat.what_am_i
```



## Referencing and setting instance variables vs. using getters and setters

### Referencing and setting instance variables

```ruby
def speak
  "#{@name} says hi!"
end
```

*Here we directly reference the instance variable*



```ruby
def name=(name)
  @name = name
end
```

*Here we directly set the instance variable*

### Using getters and setters

Reference getters/setters whenever getters/setters exist, explained in the *"How to Call getters and setters"* section.



## Class inheritance, [encapsulation](https://launchschool.com/books/oo_ruby/read/the_object_model#whyobjectorientedprogramming), and [polymorphism](https://launchschool.com/books/oo_ruby/read/the_object_model#whyobjectorientedprogramming)

### Inheritance

* used to extract common behaviors from classes that share that behavior
* Two primary ways that Ruby implements inheritance
  * Class inheritance
  * Mixing in Modules

#### Class Inheritance

* when a class inherits behavior from another class
* class that is inheriting is the subclass, class that it inherits from is the superclass
* if there **is-a** relationship, class inheritance is usually the correct choice

```ruby
class Pet # superclass
  def speak
    "Hello!"
  end
end

class GoodCat < Pet # subclass
end

class GoodDog < Pet # subclass
end

GoodCat.new.speak # => "Hello!"
GoodDog.new.speak # => "Hello!"
```

##### Method Overriding

```ruby
class Pet
  def speak
    "Hello!"
  end
end

class GoodCat < Pet
  attr_accessor :name
  
  def initialize(n)
    self.name = n
  end
  
  def speak # overridding the speak method in the Pet class
    "Meow, I'm #{self.name}"
  end
end

def GoodDog < Pet; end

GoodCat.new('Mila').speak # => "Meow, I'm Mila"
GoodDog.new.speak # => "Hello!"
```

##### `super`

* let's us call methods earlier in the method lookup path
* Searches for method with the same name, then invokes it
* automatically forwards arguments that were passed to the method from which `super` is called

##### Calling `super` without parenthesis

* when called without parenthesis `super` will pass all arguments passed to the method `super` is invoked within

```ruby
class Pet
  def speak
    "Hello!"
  end
end

class GoodCat < Pet
  def speak
    super + " from GoodCat class"
  end
end

Goodcat.new.speak # => "Hello! from GoodCat class"
```

*In the above example we've defined a `Pet` class with a `speak` instance method. We then defined `GoodCat` which subclasses `Pet` also with a `#speak` instance method to override the inherited version. In the subclass' `#speak` method we use `super` to invoke the `speak` method from the superclass, `Pet`, and then we extend the functionality by appending some text to the return value.*



##### Calling `super` with explicit arguments

Example of expliciting telling which arguments `super` can pass to the superclass's method

```ruby
class Pet
  def initialize(name)
    @name = name
  end
end

class GoodCat < Pet
  def initialize(name, color)
    super(name) # invokes initialize in superclass passing in a single argument
    @color = color
  end
end
```

*In the above example we've defined a `Pet` class with an `#initialize` instance method. We then defined `GoodCat` which subclasses `Pet` also with an instance method to override the inherited version. In the subclass `#initialize` method we invoke `super` passing a single `name` argument and then extend that functionality by initializing an instance variable `@color` to the value of the parameter `color`.*



##### Calling `super` without passing arguments

```ruby
class Pet
  def speak
  end
end

class GoodCat
  def speak(volume)
    super() + ", my name is #{self.name} and I am #{volume}"
  end
end 
```

*In the above example we have defined a `Pet` class with a `#speak` instance method. We defined a `GoodCat` which subclasses `Pet` also with an instance method to override the inherited version. In the subclass `#speak` instance method we invoke `super` appending empty parenthesis `()`  invoking the `#speak` instance method in the superclass without passing any arguments. We then extend that functionality by appending a String containing the `name` attribute and the `volume` argument passed in.*



## [Modules](https://launchschool.com/lessons/dfff5f6b/assignments/2cf31cc8)

* A way to achieve polymorphism in Ruby. 
* A way to DRY up your code

### Mixing in Modules

* A module is "mixed in" to a class using the `include` method invocation
* Ruby's way of supporting multiple inheritance
* sometimes referred to as **interface inheritance**
* if there is a **has-a** relationship, **interface inheritance** is generally the better choice
* when methods are being repeated and can't be solved by typical single-inheritance

```ruby
# single-inheritance would cause a lot of unnecessary attributes
# defining amodule eliminates that by mixing in appropriate attributes and behaviors of earnable buildings

# Property
# - Residental
# 	- Rental
# 	- Home
# - Business
# - Government

def Earnable
  attr_accessor :income
end

class Property
end

class Residential < Property
end

class Business < Property
  include Earnable
end

class Government < Property
end

class Rental < Residential
  include Earnable
end

class Home < Residential
end
```

*In the above example a `Property` class is defined with `Residential`, `Business`, and `Government` all subclassing from `Property`. We don't want all properties to have an `income` attribute as not all properties have incomes, specifically all Business properties earn income, some Residential properties do, depending of whether it's a Rental or a Home, and no Government properties do. The best way to implement the `income` attribute is to provide the setter/getter methods via a module, mixing in behaviors as needed. This is done by defining the `Earnable` module that provides  `attr_accessor :income`, then including the `Earnable` module in `Property` subclasses that provide income.*



## Method lookup path
## self

* `self` is a way of being explicit about what our program is referencing and what our intentions are as far as behavior
* `self` changes depending on the scope it is used in

### Calling `self`

#### Within a class, inside of an instance method

* references the object that called the method -- the calling object

```ruby
class GoodCat
  def what_is_self
    self
  end
end

GoodCat.new.what_is_self # => #<GoodCat:0x007... >
```

Not restricted to just the accessor methods; can be used with any instance method

```ruby
class GoodCat
  def a_method
    self.info
  end
  
  def info
    "super relevant info"
  end
end
```

#### Inside class but outside of instance method

* references the class
* can be used to define class methods

```ruby
class GoodCat
  def self.class_method
  end
  
  puts self #=> GoodCat
end
```

## Reading OO code
## Fake operators and equality
## Truthiness
## Working with collaborator objects