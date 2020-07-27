# Polymorphism

## Sources

[Launch School - OOP Book](https://launchschool.com/books/oo_ruby/read/the_object_model)

---

## Terminology

| Term  | Definition |
| ----- | ---------- |
| poly  | many       |
| morph | forms      |
|       |            |

## Notes

The ability for difference types of data to respond to a common interface. For instance, if we have a method that expects argument objects that have a `move` method, we can pass it any type of argument, provided it has a compatible `move` method.



```ruby
class Person
  def move
    "Walks"
  end
end

class Dog
  def move
    "Runs"
  end
end

class Penguin
  def move
    "Waddles"
  end
end

class Car
  def move
    "Drives"
  end
end

def move_objects(objects_that_move)
  objects_that_move.each { |obj| puts obj.move }
end

objects = [Car.new, Dog.new, Penguin.new, Car.new]
move_objects(objects)
```

The above code is an example of polymorphism as the `move_objects` method interacts with many different objects that all have a single `move` method.