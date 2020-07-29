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

### Polymorphism

**Polymorphism** refers to the ability of objects with different types to respond in different ways to the same method invocation; that is, data of different types can respond to a common interface. It's crucial to OO programming and can lead to more maintainable code.



### Polymorphism through inheritance

```ruby
class Animal
  def eat
  end
end 

class Fish < Animal
  def eat
  end
end

class Cat < Animal
  def eat
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Cat.new]
array_of_animals.each { |animal| feed_animal(animal) }
```

> Looking at this example, we can see that every object in the array is a different animal, but the client code can treat them all as a generic animal, i.e., an object that can eat. Thus, the public interface lets us work with all of these types in the same way even though the implementations can be dramatically different. That is *polymorphism* in action.



### Polymorphism through duck typing

```ruby
class Wedding
  attr_reader :guests, :flowers, :songs
  
  def prepare(preparers)
    preparers.each { |preparer| preparer.prepare_wedding(self) } #duck typing
  end
end

class Chef
  def prepare_wedding(wedding)
    prepare_food(wedding.guests)
  end

  def prepare_food(guests)
    #implementation
  end
end

class Decorator
  def prepare_wedding(wedding)
    decorate_place(wedding.flowers)
  end

  def decorate_place(flowers)
    # implementation
  end
end

class Musician
  def prepare_wedding(wedding)
    prepare_performance(wedding.songs)
  end

  def prepare_performance(songs)
    #implementation
  end
end
```

> We can see that there is no inheritance in this example, but we still have polymorphism. Each class must define a `prepare_wedding` method and implement it in its own way. If we must add another preparer, we can create another class and just implement `prepare_wedding` to perform the appropriate actions.



### My Example

For instance, if we have a method that expects argument objects that have a `move` method, we can pass it any type of argument, provided it has a compatible `move` 

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