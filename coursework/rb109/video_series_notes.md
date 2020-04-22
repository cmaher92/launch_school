# Beginning Ruby Video Series
## Video 2

### Difference between reassignment, concatenation, and push (<<)
```ruby
def amethod(param)
  param += ' universe' # reassignment
  param + ' universe'  # concatenation
  param << ' world'    # push (mutating)
end

str = 'hello'
amethod(str)

p str # => 'hello'
```

* On line 6, `amethod` is defined with `param` as a paramater
* On line 12, the local variable `str` is initialized pointing to the String object 'hello'
* On line 13, `amethod` is invoked passing in the local variable `str`
* On line 6, `param` now points to the String Object `hello`
* On line 7, the `param` local variable is reassigned to a new String object `'hello universe'`
* On line 8, the `param` local variable is concatenated with the String literal ` universe` returning `hello universe universe`
  but is never used
* On line 9, the `param` local variable is mutated by calling the `<<` method, returning `hello world` which is also the return value of the method
* On line 15, the `str` local variable is passed to the `p` method, returning `hello`. 

The key in the above example is to recognize that because `param` was reassigned on line 7, the `<<` method mutates the new object after reassignment, not the original object. 

 Variables point to objects, objects live in memory.

