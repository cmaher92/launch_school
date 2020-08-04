# Study Guide

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

#### private setter methods

You must use `self` when invoking a private setter method (Ruby 2.7 allows `self` prepending to all references to private methods so this shouldn't be a big deal but be aware of it)

```ruby
class GoodCat
  def initialize(name)
    self.name = name
  end
  
  private
  
  attr_accessor :name
end
```



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



### Private, Protected, and Public

* Class should have as few public methods as possible. It lets us simplify using that class and protect data from undesired changed from the outer world.

#### Public

* method that is available to anyone who knows either the class name or the object's name
* these methods are readily available for the rest of the program to use
* Comprise the class's interface (how other classes and objects will interact with this class and its objects)

#### Protected

* defined by invoking the `protected` method within a class definition
* from inside the class, `protected` methods are accessible by any instance of the same class
* from outside the class, `protected` methods are treated just like private methods

##### Referencing protected methods from within a class

```ruby
class GoodCat
  def a_pub_method
    "Will this work? " + self.a_protected_method
  end
  
  protected
  
  def a_protected_method
    "Yes, I'm accessible from within the class!"
  end
end
```

*In the above example, the instance method `a_pub_method` references the protected instance method `#a_protected_method` from within the class.*

```ruby
class GoodCat
  attr_accessor :name
  attr_writer :age
  
  def initialize(name, age)
    self.name = name
    self.age = age
  end
  
  def ==(other)
    self.age == other.age
  end
  
  protected
  
  attr_reader :age
end

mila = GoodCat.new('Mila', 5)
fred = GoodCat.new('Fred', 4)
mila == fred # => false
```

*The code in the above example demonstrates that any instance of the class can reference a protected method from within the class. On line 11, the `==` method is overridden and takes a parameter `other`. On line 21 the `==` method is invoked passing in an instance of the `GoodCat` class which is assigned to the `fred` local variable. On line 11, `self.age` is invoked calling the protected getter method `age` and is compared to the return value of `other` which then calls `age` as well. This code works because `age` is a protected method. The comparison returns `false`.*

#### Private

* defined by invoking the `private` method within a class definition, anything below it is private unless negated by another method like `protected`
* Only accessible from other methods within the class

```ruby
class GoodCat
  attr_writer :age
  attr_accessor :name
  
  def initialize(name, age)
    self.name = name
    self.age = age
  end
  
  def age
    calculate_age # calculate_age is only accessible from other methods in the class
    self.calculate_age # you can now do this in Ruby 2.7
  end
  
  private
  
  def calculate_age
    @age * 2
  end
end

mila = GoodCat.new('Mila', 5)
mila.calculate_age
# NoMethodError: private method `calculate_age' called for
# 	#<GoodCat:... @name="Mila", @age=5>
```

*In the above example, the code is demonstrating that the private instance method `#calculate_age` is only accessible from other methods in the class. On line 11, the `#age` instance method is able to invoke the `#calculate_age` private instance method from within the class without an issue. However, on line 22, when an instance of `GoodCat` invokes the `#calculate_age` private instance method a `NoMethodError` is raised, demonstrating that you cannot invoked private methods from outside of the class.*

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



## Class inheritance, encapsulation, and polymorphism

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



#### Variable scope

Overview:

* **Instance Variables** behave the way we'd expect. The only thing to watch out for is to make sure the instance variable is initialized before referencing it.
* **Class Variables** have a very insidious behavior of allowing sub-classes to override super-class class variables. Further, the change will affect all other sub-classes of the super-class. This is extremely unintuitive behavior, forcing some Rubyists to eschew using class variables altogether.
* **Constants** have lexical scope which makes their scope resolution rules very unique compared to other variable types. If Ruby doesn't find the constant using lexical scope, it'll then look at the inheritance hierarchy.

##### Instance variables

* instance variables can be referenced by subclasses

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class GoodCat < Animal
  def meow_name
    "meow! my name is #{@name} meow!"
  end
end

mila = GoodCat.new('Mila')
mila.meow_name # => "meow! my name is Mila meow!"
```

*When `mila` what instantiated `GoodCat.new` was invoked, and since `GoodCat` doesn't have an `initialize` instance method, the method lookup path went to the super class `Animal` and executed `Animal#initialize` which in turn, initialized the `@name` instance variable.*

##### class variables

* accessible to sub-classes
* loaded when the class is evaluated

##### constants

* have lexical scope, making scope resolution more unique compared to other variable types
* if not found using lexical scope, it'll then look at the inheritance hierarchy
* uses `::` namespace resolution operator

###### Referencing constants in a seperate class

```ruby
class Person
  FEET = 2
end

class Dog
  def feet
    Person::FEET * 2
  end
end

Dog.new.feet # => 4
```

*The above code demonstrates that you can reference constants in unrelated classes using the namespace resolution operator*

###### Referencing constants initialized in a superclass

```ruby
class Animal
  FEET = 4
end

class Cat < Animal
  def self.feet
    FEET
  end
  
  def feet
    FEET
  end
end

Cat.feet     # => 4
Cat.new.feet # => 4
```

*The above code demonstrates that a constant initialized in a super-class is inherited by the sub-class, and can be accessed by both class and instance methods*

###### Referencing constants when mixing in a module

```ruby
module Hygene
  def clean_feet
    "Cleaning all #{ANIMAL::FEET} feet."
  end
end

class Animal
  FEET = 4
end

class Cat < Animal
  include Hygene
end

Cat.new.clean_feet
```

*The above code demonstrates that constants have lexical scope and to reference a constant from a mixed in module you must reference the class where the constant is initialized `Animal` or a class that inherits from it (`Cat::FEET` would have worked as well on line 3).*

### Polymorphism

* refers to the ability of objects with different types to respond in different ways to the same message (or method invocation)
  * that is data of different types can respond to a common interface
* leads to more maintainable code
* Commonly polymorphism involves inheritance from a common superclass, however it's not required

#### Several ways to implement polymorphism

##### Polymorphism through inheritence

```ruby
class Player
  def turn
  end
end

class Dealer < Player
  def turn
  end
end

class Human < Player
  def turn
  end
end

def player_turn(player)
  player.turn
end

players = [Dealer.new, Human.new]
players.each { |player| player_turn(player) }
```

*The above code demonstrates polymorphism by way of inheritance, as multiple objects of different types are responding to a single interface, in this case the `#turn` instance method. On line 20, an array in initialized with a `Dealer` instance and a `Human` instance, which is then assigned to the `players` local variable. `players` is iterated over and for each instance the `player_turn` method is invoked, passing in each instance from the `players` array of objects. Within the `player_turn` method the `#turn` method is invoked for each Object, and because each Object is a different type and all of the instances are invoking the same `#turn` method, it's clear that polymorphism is the concept being demonstrated.*



##### Polymorphism through duck typing

* Duck typing in Ruby doesn't concern itself with the class of an instance, instead it focuses on the interface

Example that attempts to implement polymorphic behavior without using duck typing.

 **How not to do it**:

```ruby
class StudySession
  def setup(applications)
    applications.each do |app|
      case app
      when Zoom
        app.start_call
      when CoderPad
        app.create_pad
      when Toggl
        app.start_timer
      end
    end
  end
end

class Zoom
  def start_call
  end
end

class CoderPad
  def create_pad
  end
end

class Toggle
  def start_timer
  end
end
```

*The issue with the above approach is that the `#setup` method has too many dependencies. It relies on specific classes and their names. It also needs to know the correct behavior to interact with for each object of their class.*

**How to do it**:

```ruby
class StudySession
  def setup(applications)
    applications.each { |app| app.begin_session }
  end
end

class Zoom
  def begin_session
    start_call
  end
  
  def start_call
  end
end

class CoderPad
  def begin_session
    create_pad
  end
  
  def create_pad
  end
end

class Toggle
  def begin_session
    start_timer
  end
  
  def start_timer
  end
end
```

*In the above example duck typing is demonstrated effectively by using a common interface for each class that the `StudySession` instances will interact with, in this case it's the `begin_session` method, which of course is defined in `Zoom`, `CoderPad`, and `Toggle` classes.*

### Encapsulation

Allows us to hide the internal representation of an object from the outside and only expose the behaviors and attributes that users of the object need. These are exposed through the public interface of a class: it's public methods.

```Ruby
class GoodCat
  attr_reader :name
  
  def initialize(name)
    self.name = name
  end
  
  def change_name(name)
    self.name = name
  end
  
  private
  
  attr_writer :name
end
```

In this example, we can change the name by calling the `change_name` method without needing to know how the `Dog` class and this method are implemented.

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

### Namespacing with modules

Using modules for namespacing means organizing similar classes under a module.

#### Advantages of using modules for namespacing:

* Easy for us to recognize related classes in our code
* Reduces likelihood of our classes coliding with other similarly named classes in our codebase

```ruby
module Headphones
  class AirPods
  end
  
  class SonyM3
  end
  
  class BoseQC
  end
end

work = Headphones::Airpods.new
study = Headphones::SonyM3.new
```

*In the above example a module `Headphones` is defined containing three related classes `Airpods` , `SonyM3`, and `BoseQC`. This demonstrates using a module to group related classes; referred to as namespacing. On line 12 an instance of `Airpods` is instantiated and assigned to the local variable `work`, because `Airpods` is nested within the `Headphones` module you must prepend the class reference with a reference to the module `Headphones` followed by the namespace resolution operator `::`.*

### Using modules as a container for methods

* These methods are referred to as module methods.
* Useful for methods that seem out of place within your code.

#### Example of defining module with module methods

```ruby
module Weather
  def self.some_out_of_place_method
  end
end

# either work for referencing the module method
Weather.some_out_of_place_method # preferred way
Weather::some_out_of_place_method
```

## Method lookup path

The order in which classes are inspected when you call a method.

### `::ancestors` to return the lookup path

```ruby
Array.ancestors # => [Array, Enumerable, Object, Kernel, BasicObject]
```

### Modules are inspected in the reverse order they are included

```ruby
module Swimmable; end

module Jumpable; end

class Pet; end

class GoodCat < Pet
  include Swimmable
  include Jumpable
end

GoodCat.ancestors # => [GoodCat, Jumpable, Swimmable, Pet, Object, Kernel, BasicObject]
```



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

### Fake Operators

#### Fake operators

* these are methods that look like operators due to Ruby's syntactical sugar but are actually methods
* these methods can be overridden
  * must be careful to follow conventions established in the Ruby standard library to avoid confusion

| Method | Operator            | Description                                                  |
| ------ | ------------------- | ------------------------------------------------------------ |
| yes    | `[]`, `[]=`         | Collection element getters and setter                        |
| yes    | `**`                | Exponential operator                                         |
| yes    | `!` , `~`, `+`, `-` | Not, complement, unary plus and minus (method names for last two are `+@` and `-@` |
| yes    | `*`, `/`, `%`       | Multiply, divide, and modulo                                 |
| yes    | `+`, `-`            | Plus, minus                                                  |
| yes    | `>>`, `<<`          | right and left shift                                         |
| yes    | `&`                 | Bitwise "and"                                                |
| yes    | `^`, `|`            | Bitwise exclusive "or" and regular "or" (or inclusive "or")  |
| yes    | `<=`, `<`, `>`, `>=`      | Less than/equal to, less than, greater than, greater than/equal to |
| yes | `<=>`, `==`, `===`, `!=`, `=~`, `!~` | Equality and pattern matching (`!=` and `!~` cannot be directly defined) |

#### Real operators

* these are operators not methods therefor cannot be overridden

| Method | Operator                                                     | Description                                    |
| ------ | ------------------------------------------------------------ | ---------------------------------------------- |
| no     | `&&`                                                         | logical "and"                                  |
| no     | `||`                                                         | logical "or"                                   |
| no     | `..`, `...`                                                  | include range, exclusive range                 |
| no     | `?:`                                                         | ternary if-then-else                           |
| no     | `=`, `%=`, `/=`, `-=`, `+=`, `|=`, `&=`, `>>=`, `<<=`, `*=`, `&&=`, `||=`, `**=`, `{` | Assignment (and shortcuts) and block delimiter |
#### The `+` method

* return a new instance of the custom object, in the below example a new instance of `Apartment`

```ruby
class Apartment
  attr_accessor :address, :members
  def initialize
    @members = []
  end
  
  def +(other_apartment)
    temp_apt = Apartment.new
    temp_apt.members = self.members + other_apartment.members
    tempt_apt
  end
end
```

*In the above code the `Apartment` class is overridding the `+` method to specify how to add two instances of `Apartment` together. In this case a new `Apartment` object is instantialized and sets the `members` of the `temp_apt`* to the return value of `self.members` and `other_apartment.members`. The `temp_apt` instance is returned.

#### Element setter and getter methods `[]` , `[]=`

* Used with classes that represents a collection

  

##### `[]` method (element getter)

```ruby
arr = %w(first second third)
arr[0]    # => 'first'
arr.[](0) # => 'first'
```

*The above example shows the implementation of `Array#[]` to reference an element. Notice how the invocation on lines 2 and 3 are much different, but actually the same, this is because of Ruby's generous syntactical sugar*



```ruby
class Apartment
  def [](idx)
    members[idx]
  end
  
  def []=(idx, obj)
    members[idx] = obj
  end
end
```

*The above example demonstrates the proper way to override element setters/getters*



##### `[]=` method (element setter)

```ruby
arr = %w(first second third)
arr[0] = 'new first' # => ['new first', 'first', 'second', 'third']
arr[]=(0, 'newer first') # => ['newer first', 'new first', 'first', 'second', 'third']
```

*In the above example we show the `Array` implementation of the element setter method `[]=` and the difference demonstrates Ruby's syntactical sugar making element setter look much nicer*



### Equality

#### `==` method

* Used to compare an objects value (are the values within these two objects the same?)
* the `==` operator is actually a method, most built-in classes like `Array`, `String`, `Integer`, etc override the `==` method to specify how to compare objects of those classes
* By default, `BasicObject#==` does not perform an equality check; instead, it returns true if two objects are the same object
  * this is why other classes often override the behavior of  `#==`

```ruby
str = 'connor'
str2 = 'connor'
str == str2 # => true
```

* The `==` method compares the object's values based on the specific class implementation, for example the `String#==` method's implementation determines what specific value is compared.
* Default `BasicObject#==` implementation is the same as `equal?`
* When you define `==` you also get `!=` for free



#### `equal?` method

Used to compare the objects themselves (are these two objects the same?)

```ruby
str = 'connor'
str2 = 'connor'
str2_copy = str2
str.equal? str2       # => false
str2.equal? str2_copy # => true (both variables reference same object)
```



#### `===` method

* Used to see if an object belongs within a group
* used implicity by the `case` statement

```ruby
(1..50) === 25 #=> true
```

In the above code the `Range` instance `(1..50)` is invoking the `===` method passing in the `Integer` instance 25, `true` is returned because `25` falls between `(1..50)`.



```ruby
String === 'Hello' # => true
String === 15      # => false
```

Here is another example of the `===` method being invoked to check whether the `String` literal `'Hello'` belongs to the group `String`. 



## Truthiness
## Working with collaborator objects

**Collaborator objects** are objects that are stored as state within another object. We call such objects collaborators because they work in collaboration with the class they are associated with.

> A collaborative relationship is a relationship of association, not of inheritance. Collaboration is a has-a relationship rather than a is-a relationship

```ruby
class Dog
  attr_accessor :name
  
  def initialize(name)
    self.name = name
  end
end

class Person
  attr_accessor :name, :pet
  
  def initialize(name)
    self.name = name
  end
end

connor = Person.new("Connor")
archie = Dog.new("Archie")

connor.pet = archie
```

*The above code is demonstrating the use of a collaborator object, specifically an instance of `Pet` which in the above code is assigned to an instance of the `Person` class's `pet` attribute. *

