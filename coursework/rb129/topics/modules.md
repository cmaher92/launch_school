# Modules

## Sources

[Launch School - OOP Book](https://launchschool.com/books/oo_ruby/read/the_object_model)

---

## Terminology

| Term                  | Definition                                                   |
| --------------------- | ------------------------------------------------------------ |
| mix in                | when you include a module in a class so it inherits the behaviors of the module |
| interface inheritance | the class inherits the interface provided by the mixin module |
| namespacing           | organizing similar classes under a module                    |

## Notes

A common naming convention for Ruby is to use the "able" suffix on whatever verb descrives the behavior that the module is modeling. 

Use cases:

* Can be used to mix-in common behaviors into classes
* namespacing (benefits include easily recognizing common classes and reducing likelihood of our classes colliding with similarly named classes)
* using as a container for methods

namespacing example:

```ruby
module Mammal
  class Cat
  end
  
  class Dog
  end
end

Mammal::Cat.new
Mammal::Dog.new
```



using a module as a container for methods:

```ruby
module Outputable
  def welcome
    puts "Welcome!"
  end
end

Outputable::welcome # => "Welcome!"
Outputable.welcome # => "Welcome!" 
```

In the above demonstration of creating a container module `Outputable` to house methods, `welcome` is called by using the *namespace resolution operator* and with *dot notation*. The invocation on like 8 is the preferred way, although both work.



