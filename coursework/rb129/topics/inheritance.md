# Inheritance

## Sources

[Launch School - OOP Book](https://launchschool.com/books/oo_ruby/read/the_object_model)

---

## Terminology

| Term       | Definition                                             |
| ---------- | ------------------------------------------------------ |
| superclass | the class that another class inherits from             |
| subclass   | the classes that are inheriting from the superclass    |
| overriding | when a subclass overrides a behavior from a superclass |

## Notes

The concept of inheritance is used in Ruby where a class inherits behaviors of another class, referred to as the superclass.

```ruby
class Cake
  attr_writer :frosting
  
  def initialize(frosting)
    self.frosting = frosting
  end
  
  def frosting
    "I'm a #{self.class} with #{@frosting} frosting"
  end
end

class Brownies < Cake
  def initialize
  end
  
  def frosting
  	"I'm #{self.class} we don't have frosting!"
  end
end

class ChocolateCake < Cake
end

cake = ChocolateCake.new('chocolate')
brownies = Brownies.new
```



### `super`

This built in method allows us to call methods earlier in the method lookup path. When called it will search the method lookup path for a method with the same name, then invoke it.



```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

archie = GoodDog.new
archie.speak # => "Hello! from GoodDog class"
```

* In the above code both `Animal` and `GoodDog` classes are defined, with `GoodDog` being a subclass of `Animal`
  * On line 13, a `GoodDog` object is instantiated and assigned to the local variable `archie`
  * On line 14, `archie` invokes the instance method `speak`, which is defined on like 8 for the `GoodDog` class
  * On line 9, `super` is invoked, which searches the superclass `Animal` for the same method finding it defined on line 2
    * `super` returns the string `"Hello!"` 
  * `'Hello!'` is then concatenated with `" from GoodDog class"` and then returned



If the method in the superclass requires arguments and `super` is called within the subclasses method of the same name, `super` will pass all arguments if not specified.

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

class Student < Person
  def initialize(name, age)
    super
  end
end

Student.new('connor', 28)
# => ArgumentError (wrong number of arguments (given 2, expected 1))
```



To avoid this, you need to specify which arguments to pass to the superclass's method

```ruby
class Student < Person
  def initialize(name, age)
    super(name)
    @age = age
  end
end

Student.new('connor', 28)
#  => #<Student:0x00007f8f2e39e1e8 @name="connor", @age=28> 
```

Calling `super` with parenthesis is the safest way to invoke a method up the lookup chain that requires no arguments

```ruby
class Student < Person
	def to_s
		super() + 'hi'
  end
end
```

