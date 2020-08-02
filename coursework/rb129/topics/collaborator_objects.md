# Collaborator Objects

## Sources

[Launch School - Lecture - Collaborator Objects](https://launchschool.com/lessons/dfff5f6b/assignments/4228f149)

[Wendy Kuhn -  Article - "No object is an island"](https://medium.com/launch-school/no-object-is-an-island-707e59ffedb4)

---

## Terminology

| Term                | Definition                                                |
| ------------------- | --------------------------------------------------------- |
| collaborator object | objects that are stored as state within another object    |
| collaboration       | a way of modeling relationships between different objects |
| inheritance         | can be thought of as an is-a relationship                 |
| association         | can be thought of a has-a relationship                    |

## Notes

Objects that are stored as state within another object are referred to as `collaborator objects`. 

> "A collaborative relationship is a relationship of association -- not of inheritance. Collaboration is a has-a relationship rather than a is-a relationship" - Wendy Kuhn
>

Collaborator objects play an important role in object oriented design, since they also represent the connections between various actors in your program. When working on an object oriented program be sure to consider which collaborators your classes will have and if those associations make sense, both from a technical standpoint and in terms of modeling the problem your program aims to solve.

```ruby
class Dog
  attr_accesor :name
  def initialize(name)
    @name = name
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

*The above code is demonstrating the use of a collaborator object*

On line 16, a `Person` object is initialized and assigned to the `connor` local variable

On line 17, a `Dog` object is initialized and assigned to the `archie` local variable

On line 19, the `connor` locla variable which is a `Person` object invokes the `pet` setter method passing in `archie` which is a `Dog` object.

* Because `connor`'s state now includes another object assigned to the `@pet` instance variable, the value that `archie` is pointing too is now a collaborator object for the `connor` object.



