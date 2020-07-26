# Calling Setters & Getters

## Sources

[Launch School - OOP Book](https://launchschool.com/books/oo_ruby/read/the_object_model)

---

## Terminology

| Term   | Definition                                                   |
| ------ | ------------------------------------------------------------ |
| getter | responsible for returning an instance variable's value for a particular object |
| setter | responsible for settings an instance variable's value for a particular object |
|        |                                                              |
|        |                                                              |
|        |                                                              |
|        |                                                              |

## Notes

The following code shows how to define setter and getter methods manually.

```ruby
class Car
  def initialize(color)
    @color = color
  end
  
  def color
    @color
  end
 
  def color=(color)
    @color = color
  end
end
```

