# Variable Scope Notes

These notes are primarily focused around the scoping rules for local variables.

The two areas that variables scoping rules are most encountered occur when dealing 
with methods and blocks. 

## Blocks

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