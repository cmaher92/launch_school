# Precision of Language

## Links

[Launch School - Precision of Language](https://launchschool.com/lessons/3315a57a/assignments/5fe1a165)

---

## Notes

**Explaining code and concepts**

Using precise vocabulary to explain code and concepts is an important way for others to understand how well I understand myself

- Pinpoint the causal mechanism at work
- Be as detailed as possible
- always be concerned with outputs, return value, and object mutations

*An example of a precise answer.*

```ruby
class Dog
  def initialize(name)
    @name = name
  end

	def sat_hello
		puts "Woof! My name is #{@name}."
  end
end
```

This code defines a `Dog` class with two methods:

- The `#initialize` method that **initializes** a new `Dog` **object**, which it does by **assigning** the **instance variable** `@name` to the dog's name **specified by the argument**.
- The `#say_hello` instance method which prints a message that includes the dog's name in place of `#{@name}.`
  - `#say_hello` returns `nil`

**The key components of this explanation are as follows:**

- Give an overview of the class and methods:
  - This code defines a `Dog` class with two methods
- Describe each method and what the method does:
  - The `#initialize` method that initializes a new `Dog` object
  - The `#say_hello` instance method prints a message that includes the dog's name
- How the method achieves that objective:
  - which it does by assigning the instance variable `@name` to the dog's name specified by the argument.
  - It uses String interpolation within the String literal `#{@name}` referencing the `Dog`'s  instance variable
- Explicitly describe the methods return value
  - `#say_hello` returns `nil`

**Key terms and phrases**

- *defines* a ..(class)..
- *initializes* a new ..(object)..
- (method name) *instance method*
- ... by assigning the instance variable ...
- specified by the ..(thing being specified)
- (method) returns (return value)