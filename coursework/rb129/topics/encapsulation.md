# Encapsulation

## Links

[Launch School - OOP Book](https://launchschool.com/books/oo_ruby/read/the_object_model)

## Terminology

## Notes

Encapsulation is hiding pieces of functionality and making it unavailable to the rest of the code base. It is a form of data protection, so that data cannot be manipulated or changed without obvious intention. Ruby accomplishes this by creating objects, and exposing interfaces (i.e., methods) to interact with those objects.

```ruby
class BankAccount
  attr_accessor :name
  def initialize(name, ssn, balance)
    self.name = name
    self.ssn = ssn
    self.balance = balance
  end
  
  def balance
    @balance
  end
  
  def ssn
    "XXX-XX-" + @ssn.last(4).to_s
  end
  
  private
  attr_writer :ssn, :balance
end

account = BankAccount.new('connor', 012762337, 15000)
account.ssn # => 'XXX-XX-2337"
```

* The above code is demonstrating encapsulation by hiding parts of the object's state.
* On line 21, a `BankAccount` object is instantiated and assigned to the `account` local variable with arguments `'connor'`, `012762337`, and `15000` being  passed in setting the `@name`, `@ssn`, and `@balance` instance variables respectively
* On line 22, the `ssn` getter method is invoked, which in this case will not expose the first 5 characters of the `@ssn` encapsulating that information making it unavailable.
* `'XXX-XX-2337'` is returned



