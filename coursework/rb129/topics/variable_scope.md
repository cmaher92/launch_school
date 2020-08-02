# Variable Scope

## Sources

[Launch School - Variable Scope Lecture](https://launchschool.com/lessons/d2f05460/assignments/b4f9e5b7)

---

## Terminology

| Term | Definition |
| ---- | ---------- |
|      |            |
|      |            |
|      |            |

### Questions

> Given the code, what happens when trying to access an instance variable that has yet to be initialized? 
>
> ```ruby
> class Person
>   def initialize(name)
>     @name = name
>     p @age.inspect # what happens?
>   end
>   
>   def age=(age)
>     @age = age
>   end
> end
> ```

## Notes

### Instance variable scope

Scoped at the *object level* and do not cross over between objects. Accessible in an object's instance methods.

```ruby
class Person
  def initialize(name)
    @name = name
  end
  
  def print_name
    puts @name # showing how the instance variable @name is available outside of the method where it was
    				   # initialized
  end
end

```



### Class variable scope

Start with `@@` and are scoped at the class level. All objects share a single copy of the class variable. Class methods can access class variables, regardless of where it's initialized.