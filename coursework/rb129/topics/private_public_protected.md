# Private, Public, and Protected Methods

## Sources

[Launch School - OOP Book](https://launchschool.com/books/oo_ruby/read/the_object_model)

---

## Terminology

| Term | Definition |
| ---- | ---------- |
|      |            |
|      |            |

## Notes

### Public Methods

Public methods can be accessed from within the class, from within another instance of the class, and from outside of the instance.

```ruby
class Dog
  def speak
    "Bark Bark Bark"
  end
  
  def speak_within_class
    self.speak
  end
  
  def other_dog_speak(other_dog)
    other_dog.speak
  end
end
archie = Dog.new

Dog.new.speak # => Bark Bark Bark
Dog.new.speak_within_class # => Bark Bark Bark
Dog.new.other_dog_speak(archie) # => Bark Bark Bark
```

The above code shows that public methods are accessible from outside of the class, from within the class, and from another instance of the same class.



### Private Methods

Private methods can only be accessed from within an instance of the class

```ruby
class Dog
  def make_howl
    howl
  end
  
  private
  
  def howl
    "Howwwwllllls"
  end
end

archie = Dog.new
Dog.new.howl # error
Dog.new.make_howl # Howwwllllls
Dog.new.make_other_dog_howl(archie) # error
```



### Protected Methods

Protected methods act exactly like private methods except that other instances of the same class can call protected methods.

```ruby
class Dog
  def make_other_dog_speak(other_dog)
    other_dog.speak
  end
  
  def make_speak
    speak
  end
  protected
  
  def speak
    puts 'bark bark'
  end
end

archie = Dog.new
Dog.new.speak # error
Dog.new.make_speak #error
Dog.new.make_other_dog_speak(archie) # bark bark
```

