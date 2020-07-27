# `Self`

## Sources

[Launch School - OOP Book](https://launchschool.com/books/oo_ruby/read/the_object_model)

---

## Terminology

| Term | Definition |
| ---- | ---------- |
|      |            |

## Notes

Two clear use cases for `self`

* use of `self` within an istance method refers to the instance itself
* `self`, outside of an instance method, references the class and can be used to define class methods

`self` changes depending on the scope it is used in. 

### Callings Methods with `self`

To call a setter method we need to use `self` prior to the method call to disambiguate from creating a local variable.

An example of calling three separate setter methods within an instance method:

```ruby
def change_info(name, height, weight)
  self.name = name
  self.height = height
  self.weight = weight
end
```



To be consistent within our code we should reference getter methods similarly:

```ruby
def info
  "#{self.name} #{self.height} #{self.weight}"
end
```



Using `self` is not restricted to interacting with setters/getters

```ruby
def some_method
  self.info # we are referring to the info method defined in the previous snippet within the same class
end
```



