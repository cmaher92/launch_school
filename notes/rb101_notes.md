# RB101 Lesson Notes
## Lesson 2

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

