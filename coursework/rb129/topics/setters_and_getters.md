# Setters & Getters

## Sources

[Launch School - OOP Book](https://launchschool.com/books/oo_ruby/read/the_object_model)

---

## Terminology

| Term   | Definition                                                   |
| ------ | ------------------------------------------------------------ |
| getter | responsible for returning an instance variable's value for a particular object |
| setter | responsible for settings an instance variable's value for a particular object |
|        |                                                              |
|        |                                                              |
|        |                                                              |
|        |                                                              |

## Notes

### Setters & Getters manually

The following code shows how to define setter and getter methods manually.

```ruby
class Car
  def initialize(color)
    @color = color
  end
  
  def color
    @color
  end
 
  def color=(color)
    @color = color
  end
end

car = Car.new('yellow')
car.color = 'black'
car.color #=> black
```

* In the above code, a `Car` object is instantiated and set to the local  variable `car`
  * the `Car` object's setter method `car=` is invoked passing in a string literal `'black'` as an argument
  * within the class definition the parameter `color` will be assigned to the instance variable `@color` which will set the instances state when `color=` is called
  * notice on line 16 the setter is called with the syntax `car.color = 'black'` it's important to understand that this is Ruby using syntactical sugar and is the same as if it were called as `car.color=('black')`. 
  * after the state is altered with the `color=` setter invocation, the getter `color` is called which returns the current value of the `@color` instance variable, in this case `'black'` is returned



Rubyists, per convention, define getter and setter methods using the same name as the instance variable they are interacting with.



### Setters & Getters with `attr_*`

Because setters and getters are so commonplace, to save room, Ruby has a built-in way to create these methods. 

Demonstration of `atrr_*` to replace manually defining getters and setters

```ruby
class Car
  attr_accessor :color
  def initialize(color)
    @color = color
  end
end

car = Car.new('yellow')
car.color #=> yellow
car.color = 'black'
car.color #=> black
```



### When invoking setter methods, they must be denoted with `self`

You must use `self` when changing an attributes value with a setter method

```ruby
class Cat
  attr_accessor :name
  
  def initialize(name)
    name = name # incorrect and will not change value
    self.name = name # correct
  end
end
```

In the above example on line 5, the `name = name` attempt at using a setter method will not work as ruby will thing the `name` to the left of the `=` is a local variable initialization and not a caller to the setter method `name=`. 



