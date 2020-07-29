# Practice Problems

## Rodney's #1
```ruby
class Animal
  def initialize(name,age)
    @name = name
    @age = age
  end
end

class Dog < Animal
  def initialize(name, age, gender)
    super(name, age)
    @gender = gender
  end
end 

spot = Dog.new('spot',2, 'male')
```

The basic principle illustrated is inheritance through the use of `Animal`'s `name` and `age` attributes being use by `Dog`

* on line 15, a new `Dog` is initialized with the arguments `'spot'`, `2`, and `'male'` being passed to the `new` class method which in turn triggers the `Dog` constructor method `initialize`. 
* Within the `initialize` method `name`, `age`, and `gender` variables are assigned to the passed in arguments
* then `super` is invoked passing in `name` and `age` as arguments, which searches the method lookup path for another definition of `initialize` which is found in the `Animal` class.
* Within the `Animal` classes `initialize` method the instance variables `@name` and `@age` are assigned with the values passed in from the `super` invocation
* Then on line 11, the final instance variable `@gender` is assigned from the `gender` variable which holds the `'male'` value
* Finally, on line 15, the newly instantiated `Dog` object is assigned to the `spot` local variable



### Feedback

use `#initialize` notation to show it's an instance method



## Rodney's #2 

```ruby
class Person
  attr_reader :pets
  def initialize(name)
    @my_name = name
    @pets = []
  end
  def add_new_pet(pet_name)
    @pets << pet_name
  end
end

class Pet
  attr_reader :pet_name
  def initialize(name)
    @pet_name = name
  end
end

bob = Person.new('Bob')
bob.add_new_pet(Pet.new('fluffy'))
bob.add_new_pet(Pet.new('spot'))
```

This code demonstrates the use of collaborator objects, specifically with the `@pets` instance variable which is an `Array` of `Pet` objects.

* On line 19 a new `Person` class in instantiated and assigned to the local variable `bob`

* On line 20, the instance method `#add_new_pet` is invoked by the `bob` local variable which is a `Bob` class
  * the `#add_new_pet` instance method on line 7 is passed a `Pet` instance that's instantiated on line 20
  * on line 8, the instance variable `@pets` invokes the `<<` method that pushes a `Pet` object onto the `Array`
    * `@pets` is a collaborate object that defined within the `#initialize` instance method on line 5, and was assigned and initialized when the `::new` class method was called on line 19.

### Feedback

> i would have added how collaborator objects usually have a has-a relationship - this matches the fact that the code is trying to illustrate that ‘bob’ has ‘pets’