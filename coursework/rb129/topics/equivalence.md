# Equivalence

## Sources

[Launch School - RB120 Lesson 3 - Equivalence](https://launchschool.com/lessons/d2f05460/assignments/9cadd494)

---

## Terminology

| Term     | Definition                                                   |
| -------- | ------------------------------------------------------------ |
| `==`     | Compares the two variables` values                           |
| `equal?` | determines whether the two variables point to the same object |
| `===`    | Essentially asking 'if `(1..50)` is a group, then does `25` belong in the group if the expression were `(1..50) === 25` |
| `eql?`   | determines if two objects contain the same value and if they're of the same class |

## Questions

>  Compare `45` and `45.00` , what will this return and why?

This will return true because the `Integer#==` implementation was prepared for this case in which an `Integer` was compared to a `Float` object and handled the conversion from `Float` to `Integer` prior to comparison.

> When you define the `#==` method what other method do you get?

You get access to the `!=` method as well.

> What method is used implicitly by the `case` statement?

The `===` method is used implicitly by the case statement.

>  What's the difference between `equal?` and `eql?`

`equal?` determines whether two variables point to the same object, while `eql?` determines if two objects contain the same value and if they're of the same class

## Notes

### The `==` method

`#==` is an instance method available on all objects and is given a dose of Ruby's syntactical sugar.

> `str1.==(str2)` is the same as `str1 == str2`



So how does `#==` know which value to use for comparison? 

>  It is determined by the class, as `BasicObject` defines `#==` allowing every object that inherits from `BasicObject` to have access to the `#==` method.



What is the default implementation of `#==`? 

> The default implementation is the same as `#equal?`  which is not very useful because we want to see is the two objects contain the same value

```ruby
class Person
end

avery = Person.new
connor = Person.new
connor2 = connor

avery == connor    # => false
connor == connor2  # => true
```



How do I override the `#==` method?

> Here we specify that we want to compare the `@name` instance variables of both objects

```ruby
class Person
  attr_accessor :name
  
  def initialize(name)
    self.name = name
  end
  
  def ==(other)
    self.name == other.name  # example of overriding the == method 
  end
end
```



What's the difference between `==` and `equal?` look like?

```ruby
str1 = 'hi'
str2 = 'hi'
str1_copy = str1

# comparing the string objects' values
str1 == str2      # => true
str1 == str1_copy # => true

# comparing the actual objects
str1.equal? str2      # => false
str1.equal? str1_copy # => true
str2.equal? str1_copy # => false
```



### The `===` method

The `===` method is also an instance method and used implicitly by the  `case` statement.

Here's an example of `===` in action

```ruby
num = 25

case num
when 1..50 then puts "small number"
when 50..100 then puts "large number"
else puts "not in range"
end
  
if (1..50) === num
  puts "small number"
elsif (51..100) === num
  puts "large number"
else
  puts "not in range"
end
```

