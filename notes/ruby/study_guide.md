# Study Guide

https://www.redpointnotebooks.com/notebooks/52d40218-9167-43bd-9697-a380d4cfcb43

## Terminology

* truthy
* boolean
* Falsey
* conditional statement
* output
* method invocation
* method definition
* Assignment and reassignment
* local variable initialization
* Transformation and selection
* Caller
* initialization
* return value
* Invoke
* side-effects
* deep copy vs shallow copy https://medium.com/rubycademy/the-complete-guide-to-create-a-copy-of-an-object-in-ruby-part-i-91be8b9daafd



## Things I need to practice

* local variables initialized within a block aren't available outside of block
  * unless it's a reserved keyword, where they don't create their own scope like for, while and until.
* when a variable is initialized with the same name as a method that is also defined when invoked which is referenced?
  * the answer here is local variable, it has a higher precedence 
* concatenating arrays



## Topics of interest

* local variable scope
  * especially how variables interact with method invocations with blocks and method definitons
* how passing an object into a method definition can or cannot permanently change the object
* working with collections
* variables as pointers
* puts vs return
* false vs nil and the idea of truthiness
* method definition and method invocation
* implicit return value of method invocations and blocks



## Assessment Questions

The questioons in this assessment will be typically testing your knowledge and understanding on more than one level.

* testing your ability to **parse code and to describe it with precision**, or **testing your knowledge of some specific syntactical aspect or language-specific feature** of the ruby programming language
* checking your understanding of some deeper, underlying principle; this may be some more fundamental aspect of the Ruby language, or a non-language specific concept that applies to programming more generally

When answering the questions, you should:

* explain your reasoning with reference to specific lines in the program
  * use line numbers to specify
* answer with **extreme precision**
  * say 'method definition' or 'method invocation' instead of just 'method'
* highlight and syntactical conventions or techincal observations where relevant
* identify the key fundamental concept or concepts being demonstrated in the question

### Anwering Question

*Example*

```ruby
greeting = 'hello'

loop do
  greeting = 'hi'
  break
end

puts greeting
```

*Ideal answer describing what is happening within the example and identifying underlying principles that the example demonstrates.*

* On line 1, the local variable `greeting` is assigned to the String `'hello'`.
* The `do..end` defines a block on lines 3 to 6, which is passed into the `loop` method

* Within the block, on line 4, `greeting` is then reassigned to the String `'hi'`.
* The `puts` method is called on line 8, with the local variable `greeting` being passed to it as an argument
  * `'hi'` is output because `greeting` was reassigned on line 4
* This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block



### Precision of Language

It's important to be able to explain why something happens using precise vocabulary and be able to pinpoint that exact casual mechanism at work. **Be precise and never be vague.**



*Another example*

```ruby
def a_method
  puts 'hello world'
end
```

*Precise description of `a_method`*

`a method` defined on line one outputs the string `'hello world'` and returns `nil`. 



### Some Specific Definitions

There are a few areas where certain things should be describes in a specific way; those are outlined below.

#### Truthiness

The assessment requires clarity about the distinction between *truthy* and the boolean `true` (and similarly the distinction between *falsey* and the boolean `false`

* In Ruby every value apart from `false` and `nil` *evaluates* to `true` in a boolean context.
  * allowing us to say that `false` and `nil` are *falsey*
  * every value apart from `false` and `nil` are *truthy*

*Example*

```ruby
a = 'hello'

if a
  puts 'hello is truthy'
else
  puts 'hello is falsey'
end
```

*Ideal explanation*

`a` evaluates to `true` in the conditional statement so `'hello is truthy'`is output.

To sum up

* use 'evaluates to true' or 'is truthy' when discussing an expression that evaluates to true in a boolean context

#### Method definition and Method invocation

When discussing methods, particularly in terms of how blocks and methods interact with local variables, we want you to explain in terms of method definition and method invocation.

#### Integer, Fixnum, Bignum

Refer to whole numbers as `Integer`

#### Variable References and Object Mutability Articles

Review articles and ensure proper understanding

------

