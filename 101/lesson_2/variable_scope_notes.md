# Variable Scope Notes

These notes are primarily focused around the scoping rules for local variables.

The two areas that variables scoping rules are most encountered occur when dealing 
with methods and blocks. 

## Blocks

Example of how to define a block
```ruby
  def random_method
    yield
    puts 'test passed'
  end
  
  random_method do
    puts 'define block test passed'
  end
  
# => define block test passed
# => test passed
# => nil 

```

This is a method that is passed a block
```ruby
[1, 2, 3].each do |num|
    puts num
end
```

This is the block specifically
```ruby
do |num|
  puts num
end
```

Which could also be written as
`{ |num| puts num }`

A block can have a parameter, specifically between the `||` symbols, in the following
example `num` is the parameter of the block.
```ruby
[1, 2, 3].each do |num|
  puts num
end
```

Ruby blocks create a new scope for local variables, think of this as the 
`inner scope`.

The rules are simple with a block's inner scope. Variables within the inner scope
can access variables outside of the scope, but variables outside cannot access
variables within.

```ruby
name = 'craig'
loop do
  puts name # => craig
  break
end
```

Example of a variable outside of the inner scope trying and failing to access a 
variable within the inner scope
```ruby
loop do
  name = 'kyle'
  break
end

puts name # => NameError: undefined local variable or method `name' for main:Object
```

## Methods

Method scopes are entirely self-contained, meaning that methods only have access
to variables that are passed in. 

Methods are not referred to as having an outer or inner scope, don't get this 
confused with the terminology used to describe the scoping rules with blocks.

Example of there not being access to variables in another scope.
```ruby
a = 'hi'

def say_hi
  puts a
end

say_hi # => NameError: undefined local variable or method `a' for main:Object
```

Example of how to properly pass a method a variable
```ruby
def say_hi(greeting)
  puts greeting
end

word = 'hello'

say_hi(word) # => hello
```

# Methods, Blocks, how they inter-relate, and how local variable scope fits in the picture

## Method definition
```ruby
def greeting
 puts 'hello'
end
```

Method definition is..
responsible for defining a certain scope for any local variables in terms of the
parameters the method has.
responsible for defining the interaction with these parameters.
responsible for how the method interacts with the block (if at all).

## Method invocation
```ruby
def greeting
 puts 'hello'
end

greeting # this is an example of invoking a method
```

```ruby
def greeting
 puts 'hello'
end

greeting { puts 'block' } # invoking method with a block
```
# How method arguments are used
Parameter not used
```ruby
def greeting(str)
  puts 'Goodbye'
end

word = 'hello'
greeting(word)
```
Parameter used
```ruby
def greeting(str)
  puts str
  puts 'Goodbye'
end

word = 'hello'
greeting(word)
```

Block not executed
```ruby
def greeting
  puts 'goodbye'
end

word = 'hello'

greeting do
  puts word
end
```

Block executed
```ruby
def greeting
  yield
  puts 'goodbye'
end

word = 'hello'

greetings do
  puts word
end
```

# Scope manipulation
When invoking a method with a block the method can use the return value of the
block

```ruby
a = 'hello'
[1, 2, 3].map { |num| a } # => ['hello', 'hello', 'hello']

```
This demonstrates that methods can access local variables through interactions
with blocks