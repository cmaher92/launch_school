# Variable Scope

## Sources

[Launch School - Variable Scope Lecture](https://launchschool.com/lessons/d2f05460/assignments/b4f9e5b7)

---

## Terminology

| Term          | Definition                                                   |
| ------------- | ------------------------------------------------------------ |
| `cref`        | chain of namespaces that Ruby will search                    |
| introspective | inward looking, allows program to examine the type or properties of object at runtime |
|               |                                                              |

### Questions

> Given the code, what happens when trying to access an instance variable that has yet to be initialized? 
>
> ```ruby
> class Person
>   def initialize(name)
>     @name = name
>     p @age.inspect # what happens?
>   end
>   
>   def age=(age)
>     @age = age
>   end
> end
> ```

`nil` is returned.



> What level is the `@@info`  initialized at?
>
> ```ruby
> class Person
>   @@info = nil
> end
> ```

`@@info` is initialized at the class level.

## Notes

### Instance variable scope

Scoped at the *object level* and do not cross over between objects. Accessible in an object's instance methods.

```ruby
class Person
  def initialize(name)
    @name = name
  end
  
  def print_name
    puts @name # showing how the instance variable @name is available outside of the method where it was
    				   # initialized
  end
end

```



### Class variable scope

Start with `@@` and are scoped at the class level. All objects share a single copy of the class variable. Class methods can access class variables, regardless of where it's initialized.



Class variables are available to sub-classes. 

```ruby
class Animal
  @@total_animals = 0
  def initialize
    @@total_animals += 1
  end 
end

def Dog < Animal
  def total_animals
    @@total_animals
  end
end

Dog.new.total_animals # => 1
```



Class variables are accessible by all instances of the class and all instances of any subclasses, therefor you can easily make the mistake of mutating the value.

```ruby
class Vehicle
  @@wheels = 4
  
  def self.wheels
    @@wheels
  end
end

class Motorcycle < Vehicle
  @@wheels = 2
end

Vehicle.wheels # => 4
Motorcycle.wheels # => 2
Vehicle.wheels # => 2
```



### Constant variable scope

Constants have *lexical* scope. Meaning that it's scoped at the scope where it is defined.

#### `Module.nesting`

Ruby looks for constants attached to modules and classes in the surrounding lexical scope of your code

```ruby
module A
  module B
  end
  module C
    module D
      B == A::B
    end
  end
end
```

When `B` is referenced Ruby first looks in the current scope `A::C::D::B` and it doesn't exist so it then descecends to the next outer scope  `A::C` and looks for `B`, once again not finding it. Finally, it searches `A` and finds `B` referencing the module `A::B`. 

This chain of namespaces that will be searched is referred to as the `cref`. 

The `cref` chain is introspectable at runtime with `Module.testing`

```ruby
module A
  module C
    module D
      Module.nesting == [A::C::D, A::C, A]
    end
  end
end
```



#### Ancestors

If the constant cannot be found by looking at any of the modules in Module.nesting, Ruby takes the currently open module or class, and looks at its ancestors.

```ruby
class A
  module B; end
end

class C < A
  B == A::B
end
```



When defining a Class or Module they are defined at the currently open class, if it's at the top-level, it attaches to `Object` which is the direct ancestor.

```ruby
module C; end
Object::C == C # => true
```