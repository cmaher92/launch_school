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





