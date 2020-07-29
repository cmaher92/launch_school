# Classes & Objects

## Sources

[Launch School - OOP Book](https://launchschool.com/books/oo_ruby/read/the_object_model)

---

## Terminology

| Term | Definition |
| ---- | ---------- |
|      |            |
|      |            |
|      |            |
|      |            |
|      |            |
|      |            |



## Notes

### Notable Differences

Class methods are only associated with the class itself, not instances of the class. Within the class methods we're restricted from adding data specific to instances of the class.



### Instance methods

Methods that pertain to an instance or object of the class.

```ruby
class Car
  def initialize(color) # instance method
    @color = color
  end
  
  def color # instance method
    @color
  end
```



Instance methods are only available to be invoked when there's an instance of the class.

```ruby
class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}!"
  end
end

Cat.greet
# => undefined method `greet' for Cat:Class (NoMethodError)
```



### Class methods

Methods that we can call directly on the class itself, without having to instantiate any objects.

```ruby
# rest of code omitted for brevity

def self.what_am_i # class method
  "I'm a Car class!"
end

Car.what_am_i # => "I'm a Car Class!"
```

Class methods are where we put functionality that does not pertain to individual objects. Objects contain state, and we have a method that does not need to deal with states, then we can just use a class method.





