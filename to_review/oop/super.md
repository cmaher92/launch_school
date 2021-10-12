# super

> keyword to call methods earlier in the method lookup path.

- When called from within a method, it calls method of same name
```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodCat < Animal
  def speak
    super + " from GoodCat class"
  end
end

GoodCat.new.speak
# => "Hello! from GoodCat class"
```

- When called with arguments, args. sent up the method lookup chain
```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, "bear")
# => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
```
- When called without parenthesis will automatically forward arguments
```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super # use () to prevent automatically forwarding arguments
    @color = color
  end
end

bruno = GoodDog.new("brown")
# => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
```
