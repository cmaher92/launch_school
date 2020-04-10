# RB101 Lesson Notes
## Lesson 2 - Small Programs

### Truthiness

| Key topics covered                                           |
| ------------------------------------------------------------ |
| Everything in Ruby is considered 'truthy' except for `false`and `nil` |
| How boolean's are represented through the `TrueClass` and `FalseClass` |
| `&&` and `||` short-circuit behavior                         |
| How truthiness in ruby is leveraged by combining the short-circuit behavior of the engine with conditional statements |



------

#### Truthiness

* helps understand the state of an object

- helps build conditional logic
- Represented in Ruby with `TrueClass` and `FalseClass`

#### **Expressions and Conditionals**

- conditionals
  - expressions should evaluate to true or false
  - (num < 10).class #=> `TrueClass`
  - code expressions can be substituted for method calls that return truthy values
```ruby
puts "it's true" if some_method_call
#=> it's true
```
*example of not using an expression that evaluates to TrueClass or FalseClass*

#### Logical Operators

* `&&`: 
  * 'and' operator
  * returns `true` only if both expressions being evaluated are true
  * evaluated left to right, allowinging chaining of `&&` operators
  * if chained any expression that evaluates to `false` will cause the entire `&&` to return false
```ruby
num < 10 && num.odd? && num > 0
```

*Example of chaining `&&` operator* 

* `||`
  * 'or' operator
  * returns `true` if either one of the evaluated objects is true
  * return `false` only when both 

#### Short-circuiting

* behavior which means it will stop evaluating expressions once it can guarantee the return value

```ruby
false && puts('hi')
#> false
```
*Example displaying that the `&&` operator short-circuits and never executes the `puts('hi')`*

```ruby
true || puts('hi')
#=> true
```
*`puts('hi')` does not execute here because the `||` operator short-circuits once it encounters `true`*

#### Truthiness

- Ruby considers more than the `true` object to be 'truthy'
  - Ruby is very liberal in how it handles truthiness and <u>considers everything to be truthy other than `false` or `nil`</u>

```ruby
num = 10

num == true
#=> false

num ? "valid num" : "error!"
#=> "valid num"
```

*This shows how ruby considers `Integer` to be truthy but not true, it will trigger conditionals, but is not equivalent to true.*

* this behavior leads to interesting code that normally wouldn't work in other less-liberal languages

```ruby
name = find_name()

if name && name.valid?
  puts "Great name!"
else
  puts "either couldn't find name or it's invalid"
end
```

*If the `#find_name` method fails to retrieve a name the **if conditional** relies on the short-circuit behavior to prevent the `#valid?` method from executing.* 

------

### Rubocop

* static code analyzer
  * analyzes code and offers advice about style format as well as potential logical errors

#### Terminology

| Term        | Definition                                                   |
| ----------- | ------------------------------------------------------------ |
| Cops        | Enforcement rules that rubocop uses                          |
| Departments | Groupings of rules                                           |
| Lint        | Analyzes code for possible logical errors or code smells     |
| Code smell  | any characteristic in the code that indicates a deeper problem |
| C           | stands ford *convention*, which means a convention was broken |
| F           | Fatal error                                                  |
| W           | warning                                                      |
| E           | Error                                                        |

#### Quick Tutorial

```bash
$ rubocop test.rb
```

Rubocop takes a file as an argument

```bash
rubocop test.rb --format offenses
```

Shows offenses per cop, and total offenses in our code



#### Configuration

Rubocop will look for a `.rubocop.yml` file in the directory it's executed in and apply configuration settings. 

------

### Debugging

The key to being a good programmer is having a patient and logical temperament.

#### Reading Error Messages

The stack strace is critical in helping you figure out where to start your debugging. One of the first things you'll have to get used to is learning how to carefully read the error stack trace. 



------

### Order of Precedence

The order in which operators are evaluted.

#### Examples of precedence

If we were to use `#p` to display the result of using a `map` method on an array there can be some interesting side-affects. 

```ruby
arr = [1, 2, 3]
p(arr.map) do |num|
  num + 1
end
# <Enumerator: [1, 2, 3]:map>
# => <Enumerator: [1, 2, 3]:map>
```

* Because `do..end` has a lowest order of precedence compared to `p` and `arr.map` so the following occurrs.
  * `array.map` is evaluated first, resolving to an Enumerator
  * the Enumerator resolved by `array.map` is passed to `p`
  * note, the `do...end` is never executed, it's simply ignored as `p` doesn't accept blocks



```ruby
arr = [1, 2, 3]
p arr.map { |num| num + 1 }
# [2, 3, 4]
# => [2, 3, 4]
```

* Here the `{..}` block has a higher precedence meaning that it gets executed first and then passed to `array.map`, rather than to `p` as in the previous example. 

**Two main takeaways:**

1. Ruby evaluates expressions based on level of precedence of the operators involved.
2. To override the default, user parentheses.

#### Ruby's `tap` method

`Object#tap`

* Useful for validating precedence, valuable debugging tool.
* Passes in the calling object inside a block and returns that same object back

```ruby
arr = [1, 2, 3]
mapped_arr = arr.map { |num| num + 1 }
mapped_arr.tap { |value| p value }     # => [2, 3, 4]
```

Useful for debugging intermediate objects in method chains. 

```ruby
(1..10)                 .tap { |x| p x }   # 1..10
 .to_a                  .tap { |x| p x }   # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
 .select {|x| x.even? } .tap { |x| p x }   # [2, 4, 6, 8, 10]
 .map {|x| x*x }        .tap { |x| p x }   # [4, 16, 36, 64, 100]
```

------

### Variable Scope

#### Blocks

* create new scope for local variables
* variable's scope is determined by where it is initalized
* peer scopes do not conflict



#### Nested Blocks

* follow same scoping rules
* usage of 'outer' and 'inner' is relative
  * use first level, second level, third level instead



*peer scopes don't conflict* 

```ruby
# peer scopes don't conflict
2.times do
  a = 'hi'
  puts a
end

loop do
  puts a # => NameError: undefined local variable or method `a' for main:Object
  break
end 
```



*multiple levels of nesting*

```ruby
a = 1 # first level

loop do
  b = 2 # second level
  
  loop do
    c = 3 # third level
    puts a
    puts b
    puts c
    break
  end
  
  puts a
  puts b
  puts c
  break
end

puts a # => 1
puts b # => NameError
puts c # => NameError
```



*avoid variable shadowing*

```ruby
n = 10
[1, 2, 3].each { |n| puts n }
# this prevents the outer scope 'n' from being accessed from the block passed to each
```



#### Methods and blocks

A block is part of the method invocation. 

*A method invocation followed by curly braces `do..end`* is the way in which **we define a block in Ruby**. 

Example: *block not used*

```ruby
def greetings(str)
  puts 'goodbye'
end

word = "Hello"
greetings { puts word }
# Outputs: 'goodbye'
```



Example: *block executed*

```ruby
def greetings
  yield
  puts 'Goodbye'
end

word = 'Hello'

greetings { puts word }

# outputs 'Hello'
# outputs 'Goodbye'
```



Example: *methods can use a return value of the block to perform some other action*

```ruby
a = 'hello'
[1, 2, 3].map { |num| a } # => ['hello', 'hello', 'hello']
```

------

### Pass by Reference vs Pass by Value

The key here is to understand how to invoke methods and what behavior to expect

The discussion stems from trying to determine what happens to objects when passed into methods. In most languages there are two ways of dealing with objects being passed into methods.

1. Treat arguments as references to the original object
2. Treat arguments as values, which are copies of the original object

#### What does pass by 'value' mean?

This will be discussed by using a traditional language, C.

When an object in C is passed by value, the method only has a *copy* of the original object.

* operations performed on the copied object have no effect on the original object

#### What does pass by 'reference' mean? 

When an object is passed by reference. the method is passed a reference to the object and can therefor change manipulate the object.

#### What Ruby does

Ruby exhibits a combination of behaviors from both 'pass by reference' as well as 'pass by value'. 

* Some refer to this as *pass by reference of the value* or *call by sharing*
* The most important concept to remember is that when an operation within the method mutates the caller, it will affect the original object



Example: *Destructive operations vs not-descructive operations*

```ruby
def add_name(arr, name)
  arr = arr + [name] # not destructive
end
names = ['connor', 'skylar']
add_names(names, 'avery')
puts names.inspect # => ['connor', 'skylar']

def add_name(arr, name)
  arr << name # destructive
end
add_names(names, 'avery')
puts names.inspect # => ['connor', 'skylar', 'avery']
```

#### Variables as pointers

Example: *Variables are pointers to physical space in memory*

```ruby
a = "hi there"
b = a
a = "not here"
p a.inspect # => 'not here'
p b.inspect # => 'hi there'
```

Example: *How reassignment reassigns a variable to a different space in memory, even when it's the same value*

```ruby
a = 'hi there'
b = a
a = 'hi there'
p a.object_id # 1100
p b.object_id # 1120 (note they both carry the same value but are still in different spaces)
```

#### Variable references and mutability of ruby objects

[Article]: https://launchschool.com/blog/references-and-mutability-in-ruby	"references and mutability in ruby"

------

#### Variables and references

```ruby
greeting = 'hello'
# => 'hello'
```

This tells Ruby:

* associate the name `greeting` with the `String` object whose value is `'hello'`
  * `greeting` *references* the String object
  * ` greeting` *is bound* to the String object

*Internally, the relationship looks like this:*

<img src="https://launchschool.com/blog/images/2016-07-23-references-and-mutability-in-ruby/greeting-is-reference.png" alt="greeting is a reference to the String &quot;Hello&quot;" style="zoom:50%;" />

```ruby
greeting = 'hello'
whazzup = greeting
```

Here, there are two references (`whazzup` and `greeting`) that reference the same object.

<img src="https://launchschool.com/blog/images/2016-07-23-references-and-mutability-in-ruby/greeting-and-whazzup-same-string.png" alt="img" style="zoom:50%;" />

#### Reassignment

If we were to reassign greeting to another object, `greeting = 'Dude!'`

<img src="https://launchschool.com/blog/images/2016-07-23-references-and-mutability-in-ruby/greeting-and-whazzup-different-strings.png" alt="img" style="zoom:50%;" />

This shows that reassignment to a variable doesn't change the object referenced by that variable; instead, the variable is bound to a completely new object. 



#### Mutability

Objects can be either mutable or immutable. Mutable objects can be changed; immutable objects cannot be changed.

Understanding mutability of an object is necessary to understanding how your language deals with those objects.

##### Immutable Objects

* Integer
* Float
* Range

Whenever one of these objects is changed, a new reference is made, the object is never changed.

##### Mutable Objects

Most objects in Ruby are mutable

Modification is done through methods permitted by the class definition, immutable objects will not have methods allowing mutation.

Example: *Demonstrates that an Array is mutable, but it doesn't create a new object. Even the object_id for arr[1] is left unchanged, the String object bound to arr[1] is mutated.*

```ruby
arr = %w(a b c)
arr[1] = 'connor'
# this doesn't affect the object_id for the arr, just for the arr[1] reference.

arr[1].gsub!('connor', 'skylar')
arr[1].object_id # this will be the same reference before gsub, just with a mutated object

```

##### A Brief Intro. to Object Passing

Immutable Objects

* Immutable Objects
  * Cannot be changed, they act like Ruby passes them around by value
* Mutable Objects
  * Can always be modified by calling one of their mutating methods
  * They act like ruby passes them around by reference

------

#### Mutating and Non-Mutating Methods in Ruby

[Article]: https://launchschool.com/blog/mutating-and-non-mutating-methods

Some mutate the caller, some mutate the object, few mutate the arguments. 

All methods that operate on on numbers and boolean values are guaranteed to be non-mutating with respect to the value.

##### Concatination is Mutating

`#<<` (concatenation implentation for ruby)

* similar to the `+=` operation, except `#<<` is mutating

##### Setters are mutating

* Setters are very similar to indexed assignment; they are methods that are defined to modify the state of an object.

* They superficially look like assignments because they employ the `something = value` syntax

```ruby
# Setter invocation
person.name = 'Bill'
person.age = 23
```

------

#### Object Passing in Ruby - Pass by Reference or Pass by Value

[Article]: https://launchschool.com/blog/object-passing-in-ruby

##### What is Object Passing? 

The receiving object and the arguments passed to a method are referred to as passing an object to a method, or, more simply, object passing.

Ruby also supports block, procs, and lambdas as well which all include the concepts of passing arguments and return values around. When discussing passing objects to and from methods, my mental model should include blocks, procs, and lamdas. 

* Terminology
  * **arguments** include 
    * actual arguments, 
    * the receiver of the method, 
    * operator operands, 
    * or a return value
  * **methods** can include 
    * methods, 
    * blocks, 
    * procs, 
    * lambdas, 
    * and even operators

##### Evaluation strategy
Determines when expressions are evaluated, and what a method can do with the resulting objects.

**Strict evaluation**: every expression is evaluated and converted to an object before it is passed along to a method

Ruby uses strict evaluation exclusively. The two most common strict evaluation strategies are *pass by value* and *pass by reference* these will be referred to as **object passing strategies**

##### Why is the Object Passing Strategy Important? 

Understanding which strategy (pass by reference or pass by value) is being used (and when) is key to understanding what happens to an object that gets passed to a method. 

*For example, if the method does something that appears to change the object, is that change local to the method, or does it result in changes to the original object?*

```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y)
puts y
```

* if Ruby were pass by value
  * just `a` would be printed because the `increment` method would only have a copy of the `y` object even though `<<` is mutating.
* if ruby is pass by reference
  * `ab` would be printed because the `increment` method would have access to the original object and `<<` is mutating
  * in the above code, `y` is passed to `increment` and `x` is defined referencing the original object, making it an alias.
  * when you modify `x` in the `increment` method, you are also modifying `y` 



##### Pass by Value

Remember with pass by value, a copy of an object is created, and it is that copy that gets passed around. Therefor when that object is passed around the original object cannot be mutated. 



In Ruby passing around immutable objects like numbers and booleans acts a lot like pass by value.

```ruby
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)
puts a # 3
puts b # 5
```



##### Pass by Reference

With pass by reference, a reference to an object is passed around. This establishes an alias between the argument and the original object: both the argument and object refer to the same location in memory. 

For example, consider the following code

```ruby
def uppercase(value)
  value.upcase!
end

name = 'William'
uppercase(name)
puts name # WILLIAM
```

Here the `uppercase` method modified the `name` through the `value` alias, so it looks like pass by reference in this scenario. 



##### It's references all the way down

Ruby's variables don't contain objects; they are merely references to objects. Even if a literal is passed to a method, ruby will first convert that literal to an object, then, internally, create a reference to the object. You can think of such literal reference as anonymous (unnamed) references. 



Before we mentioned that it seems like ruby is using pass by value with immutable objects, however if you examine the following code you will see that the variable outside of the method and inside of the method both have the same object_id. 

```ruby
def print_id(number)
  puts "in method object id = #{number.object_id}"
end

value = 33
puts "Outside method object = #{value.object_id}"
print_id(value)
```

This code prints:

```ruby
Outside method object id = 67
In method object id = 67
```

`number` and `value` reference the same object despite being immutable, meaning that it cannot be pass by value, beccause pass by value would have created a copy of the object aynd should have referenced a different place in memory. 

##### Pass by Reference Value

In a strictly pass by reference language assignment would be mutating, but Ruby's variables and constants are not objects, but references to objects.  <u>Therefor Assignment in Ruby simply changes which object is bound to a particular variable.</u> 

While we can change which object is bound to a variable inside of a method, we can't change the binding of the original arguments. We can change the objects if the objects are mutable but the references themselves can't be changed. 

Ruby appears to be making copies of the references then passing those copies into the methods, still allowing for the original object to be mutated, but not allowing for the reference to be. 

**Ruby passed around copies of the references.** In short, ruby is not pass by reference or pass by value but instead employs a third strategy that blends the two strategies.

##### Final mental model

What object passing strategy ruby uses:

* **pass by reference value**, meaing ruby passes around copies of the references. This is hard to understand at first, therefore the following two answers can be used to help with a mental model. 
  * pass by reference is accurate, as long as you account for the differences with assignment and immutability
  * ruby acts like pass by value for immutable objects, pass by reference for mutable objects but this is only an appearance and is not the truth. It's only helpful as a mental model while learning to help with understanding what will happen if a method modifies an argument. 

------

### Coding Tips 2

#### Making code more readable

Separate code into chunks with new lines.

1. Variable intitialization
2. User input/validation
3. Using the variable



#### Should a method return or display?

> Understand if a method returns a value, has side effects, or both.

*Side-effects means that the method is either going to display something to the output or  will mutate an object.* 

For example

```ruby
def total(num1, num2)
  puts num1 + num2
end
# side effect for #total is that it displays something

def append(targeted_array, value_to_append)
  target_array << value_to_append
end
# mutates the object
```

Paying attention to methods that have side effects is critical to writing code that is well organized and easy to read. 

If a method has both side effects and a meaningful return value, it's a red flag. Try to avoid writing methods that do this, as it will be very difficult to use these methods in the future.

#### Name methods approprietly

Chose good method names to help yourself or anyone reading your code.

**If you find yourself constantly looking at a method's implementation every time it's used than the method needs to be improved.**

A method should either output a value, mutate (with a `!` as a suffix), or display/print with `print_` or `display_` as the prefix. 



#### Don't mutate the caller during iteration

You can mutate the elements within a collect while iterating, but don't mutate the collection itself, otherwise the behavior is unexpected and hard to understand.



#### Don't use assignment in a conditional

It becomes unclear if you meant to use `==` or actually meant to do assignment.



#### Use underscore for unused parameters

------

## Lesson 3 - Practice Problems

#### Easy 2

*Question 1*

In this hash of people and their age, see if 'Spot' is present. What are two other methods that would work just as well for this solution?

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# answers
ages.include?('Spot') # false
ages.key?('Spot') # false
ages.member?('Spot') # false
```



*Question 2*

Starting with the string `munsters_description`, convert the string in the following ways.

```ruby
munsters_description = 'The Munsters are creepy in a good way.'

# answers
munsters_description.swapcase
munsters_desciprtion.capitalize
munsters_description.downcase
munsters_description.upcase

# 'tHE mUNSTERS ARE CREEPY IN A GOOD WAY.'
# 'The munsters are creepy in a good way.'
# 'the munsters are creepy in a good way.'
# 'THE MUNSTERS ARE CREEPY IN A GOOD WAY.'
```



*Question 3*

We have most of the Munster family in the `age` hash, add the ages from the `additional_ages` hash to the existing hash.

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge(additional_ages)
# => {"Herman"=>32, "Lily"=>30, "Grandpa"=>5843, "Eddie"=>10, "Marilyn"=>22, "Spot"=>237}
```



*Question 4*

See if the name 'Dino' appears in the string below.

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."

# answers
advice.match?(/\sDino\s/) # => false
advice.match?('Dino')     # => false
```



*Question 6* and Question 7

(6) How can we add the family pet "Dino" to our `flintstones` array?

(7) How can we add multiple items (Dino and Happy) to the array?

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones + ['Dino'] # not mutating
flintstones.push('Dino') # or <<, both mutating

flintstones + ['Dino', 'Happy']
flintstones.concat(['Dino', 'Happy'])
```



*Question 8*

Shorten this sentence, removing everything but 'house'. Make the return value `'Few things in life are as important as '`. Leave the `advice` variable as `'house training your pet dinosaur.'`

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0...advice.index('house'))
# using slice element reference which will mutate the advice string
# slicing from the 0th index to the index up to but not including where 'house' appears
```



*Question 9*

Write a one-liner to count the number of lower-case `t` characters in the following string.

```ruby
statement = "The Flintstones Rock!"
statement.count('t')
```



*Question 10*

If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?

```ruby
title = 'Flintstone Family Members'
title.center(40)
```

------

#### Medium 1

*Question 1*

For this problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right. 

```ruby
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
```



```ruby
str = 'The Flintstones Rock!'
10.times { |n| puts (' ' * n) + str }
```



*Question 3* 

How can you make this work without using `begin/end/until` and be able to handle `0` and negative numbers. 

```ruby
# find factors
# factors are numbers that can be multiplied to get the number

# iterate from 1 to the number passed in
# 1...n

# select all numbers that evenly divide into the number
# number % current_num == 0

# issues
# ZeroDivisionError, if a 0 is passed in, 0 / 0 creates error

def factors(number)
  (1...number).select { |n| number % n == 0 }
end
```



*Question 4*

Write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

>  Is `<<` or `+` better for modifying the buffer?

I think that `+` is better because the `buffer` object will not be mutated

> Is there a difference between the two?

The implementation that uses `<<` mutates the object and the method name doesn't make it clear that the `buffer` will be mutated, leaving an unexpected side-effect. 

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```



*Question 6*

What is the output of the following code?

```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# answer
# => 34
```



*Question 7*

One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  changed_hash = {}
  changed_hash = changed_hash.merge(demo_hash)
  p changed_hash.object_id, demo_hash.object_id
  changed_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

```ruby
mess_with_demographics(munsters)
```

> Did the family's data get ransacked? Why or why not?

Yes, setters are mutating. Meaning that when the `mess_with_demographics` method ran, the age of each element in the `munsters` hash was mutated, along with the gender.

*Question 8*

Method calls can take expressions as arguments. Suppose we define a method called `rps` as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.

```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```

What is the result of the following call?

```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
rps('rock', 'paper') # => 'paper'
rps('rock', 'scissors') # => 'rock'
rps('paper', 'rock') # => 'paper
rps('paper', 'rock') # => 'paper'
# answer
# => paper

```

------

#### Medium 2

*Question 3*

Let's call a method, and pass both a string and an array as parameters and see how even though they are treated in the same way by Ruby, the results can be different.

Study the following code and state what will be displayed...and why:

```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

------

#### Hard 1

*Question 1*

What do you expect to happen when the `greeting` variable is referenced in the last line of the code below?

```ruby
if false
  greeting = 'hello world'
end

greeting #=> nil
```

*Answer*

`nil` , when you inititalize a local variable within an if block, even if that if block doesn't get executed, the local variable is initialized to `nil`. 



*Question 2*

What is the result of the last line in the code below?

```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << 'there'

puts informal_greeting # => 'hi there'
puts greetings # => {:a => 'hi there'}
```

*Answer*

`'hi there'` is returned because the `informal_greeting` object is mutated with `<<` which is the same object that the value for `greetings[:a]` points to. 

------

## Lesson 4 - Ruby Collections

### Introduction to the PEDAC process

The PEDAC process is one approach to solving programming problems. Its primary goal is to help you identify and avoid pitfalls that you may encounter when you don't code with intent.

P - Understand the **P**roblem

E - **E**xamples

D - **D**ata Structure

A - **A**lgorithm

C - **C**ode

#### Understanding The Problem

1. Read the problem's description
2. Check the test cases, if any
3. If any part of the problem is unclear, ask the interviewer or problem requester to clarify the matter

```ruby
# input: string
# output: string (not the same object)
# rules:
# 	explicit requirements:
# 		- every palindrome in the string must be converted to
#			  uppercase. (Reminder: a palindrome is a word that read
# 			the same forwards and backward).
# 		- palindromes are case sensitive ('Dad' is not a palindrome, but 'dad' is).

# 	implicit requirements:
# 		- the returned string shouldn't be the same object
```



#### Data Structure/Algorithm

Data structures influence your algorithm, and for that reason, these two steps are often paired. The biggest problem students have when writing algorithms is providing sufficient detail.

*Example of applying data structures/algorithm from PEDAC process*

```ruby
# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:
# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# Some questions you might have?
# 1. What is a substring?
# 2. What is a palindrome?
# 3. Will inputs always be strings?
# 4. What does it mean to treat palindrome words case-sensitively?

# input: string
# output: an array of substrings
# rules:
#      Explicit requirements:
#        - return only substrings which are palindromes.
#        - palindrome words should be case sensitive, meaning "abBA"
#          is not a palindrome.
```

```ruby
# Data structure
# Array

# Algorithm
# init empty results array
# find all substrings within the array
# init variable named length to 3
# loop, that will find substrings of n length, beginning at 3
# 	init start variable to 0
# 	loop, finding the substrings of the length
# 		retrieve substring
# 		if substring is the same length as length append to results array
# 		else, break
# 	increment length by 1
# 	break when length == the size of the string
# with an array of all possible substrings within the array
# create a method that determines if a string is a palindrome
```

------

### Looping

Using a `while` loop print 5 random numbers between 0 and 99.

```ruby
count = 0
while count < 5
  puts rand(0..99)
  count += 1
end
```



Use an `until` loop to print each number

```ruby
numbers = [1, 2, 3, 4, 5]
idx = 0
until idx == numbers.size
  puts numbers[idx]
  idx += 1
end
```



Use a `for` loop so it only prints odd numbers

```ruby
for i in 1..100
  puts i if i.odd?
end
```



Use a `for` loop to greeting each friend

```ruby
friends = ['Sarah', 'John', 'Hannah', 'Dave']
for friend in friends
  puts "Hi #{friend}"
end
```



Write a loop that prints numbers 1-5, and whether the number is even or odd

```ruby
for i in 1..5
  i.odd? ? puts("#{i} is odd!") : puts("#{i} is even!")
end
```



Modify the following code so that the loop stops if `number` is equal to or between 0 and 10.

```ruby
loop do
  number = rand(100)
  break if number.between?(0, 10)
  puts number
end
```



Using an `if/else` statement, run a loop that prints `"The loop was processed!"` one time if `process_the_loop` equals `true`. Print `"The loop wasn't processed!"` if `process_the_loop` equals `false`.

```ruby
process_the_loop = [true, false].sample

if process_the_loop
  while process_the_loop
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end
```

### Selection and Transformation

Selection: 

* picking certain elements out of the collection depending on some criterion.

Transformation: 

* refers to manipulating every element in the collection.

It's critical to not only understand how to perform these actions, but to develop a high level of proficiency so you can quickly and fluently work with collections.

#### Looping to Select and Transform

*Applying selection to a collection*

```ruby
alphabet = ('a'..'z').to_a.join
selected_chars = ''
counter = 0

loop do
  # selection criteria
  selected_chars << alphabet[counter] if alphabet[counter] == 'g'
  counter += 1
  break if counter == alphabet.length
end
```

In the above `loop` the *selection criteria* is what makes this a *selection* loop. It only selects the 'g' characters and adds them to the `selected_chars` string.



*Applying transformation to a collection*

```ruby
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  # transformation criteria
  transformed_elements << (fruits[counter] + 's')
  counter += 1
  break if counter == fruits.size
end
```

In the above `loop` transformation is applied to the fruits array, returning a new array `transformed_elements`. Remember it's important to pay attention to whether the original collection was mutated or if a new collection was returned.



*Select the key-value pairs where the value is `'Fruit'`*

```ruby
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def find_pairs_by_value(hash, value)
  selected_pairs = {}
  counter = 0
  keys = hash.keys

  loop do
    break if counter == keys.length
    key = keys[counter]
    if hash[key] == value
      selected_pairs[key] = value
    end
    counter += 1
  end

  selected_pairs
end

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
```



*Write a method that takes an array of numbers and mutates the passed in array*

```ruby
numbers = [1, 2, 3, 4, 5]

def double_numbers!(ary)
  counter = 0
  loop do
    break if counter == ary.length
    # mutating transformation criteria
    ary[counter] *= 2
    counter += 1
  end
  ary
end
```



*Write a method that takes a string and a letter and selects only the specified letter*

```ruby
def select_letter(sentence, letter)
  selected = ''
  counter = 0
  loop do
    break if counter == sentence.length
    selected << sentence[counter] if sentence[counter] == letter
    counter += 1
  end
  selected
end
```



#### The `for` loop

```ruby
alphabet = ('a'..'z').to_a.join

for char in alphabet.chars
  puts char
end
```



------

### Methods

This lesson will take a closer look at `each` , `select`, and `map`. 

#### `each`

One of the main difference between using a standard `loop` is that `each` returns the original collection.

```ruby
ary = [1, 2, 3]
ary.each { |num| puts num }
# => [1, 2, 3]

counter = 0
loop do
  break if counter == ary.size
  puts ary[couner]
  counter += 1
end
# => nil
```



#### `select`

returns only the elements where the corresponding block returned a truthy value in a new collection.

#### `map`

Similar to `select` map also considers the return value of a block. Whatever the block returns is placed into a new collection. 

```ruby
[1, 2, 3].map { |num| num * 2 } 
# => [1, 4, 6]
```

------

### More Methods

#### `Enumerable#any?`

*Example*

```ruby
[1, 2, 3].any? { |num| num > 2 } # => true
```

There are two return values that we need to be aware of here, *the return value of the method* and *the return value of the block*. `any?` looks at the truthiness of the block's return value in order to determine what the method's return value will be. 



*It can also be used with a block*

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.any? { |key, value| value.size > 4 }
# => false
```



#### `Enumerable#all?`

`all?` functions in a similar way to `any?`. It also looks at the truthiness of the block's return value, but the method only returns `true` if the block's return value in every iteration is truthy. 

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.all? { |k, v| v != nil }
# => true
```



#### `Enumerable#each_with_index`

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end
# pair is an array of k, v
```



#### `Enumerable#each_with_object`

```ruby
[1, 2, 3].each_with_object([]) do |num, ary|
  ary << num if num.odd?
end
# The method argument, [] in this case, must be a collection arguments
# will return the collection argument

{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }
```

*Notice that when `each_with_object` is handling a hash it turns the element into an array `[k, v]`, instead of defining the whole pair, you can use parenthesis to define the key and value `(key, value)`*

#### `Enumerable#include?`

You can use `#include?` on a hash, however it only checks for the existance of a key, it does not check the corresponding value.

```ruby
{ a: 'ant', b: 'bear', c: 'cat' }.include?('bear')
# => false
{ a: 'ant', b: 'bear', c: 'cat' }.include?(:c)
# => true
```



#### `Hash#has_value?` or `Hash#value?`

If you want to find out if a value exists within a hash, either of these aliased methods will work.



#### `Enumerable#partition`

`partition` divides up elements in the current collection into two collections, depending on the block's return value. 

```ruby
[1, 2, 3].partititon { |num| num.odd? }
# => [[1, 3], [2]]

# the most idiomatic way to use partition is to parallel assign variables
odd, even = [1, 2, 3].partition { |num| num.odd? }
odd 
# => [1, 3]
even
# => [2]
```



