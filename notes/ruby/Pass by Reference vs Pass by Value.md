# Pass by Reference vs Pass by Value

Terminology

| Term              | Definition                                                   |
| ----------------- | ------------------------------------------------------------ |
| Reference         | the use of a source of information to ascertain something    |
| Pass by Reference | the caller and the callee use the same variable for the parameter. If the callee modifies the parameter variable, the effect is visible to the caller's variable. |
| Pass by Value     | The caller and callee have two independent variables with the same value. If the callee modifies the parameter variable, the effect is NOT visible to the caller. |
| reference types   | the actual object data is stored separetely somewhere else   |
| caller            | this is the name of the method                               |
| shallow copy      | Bit-wise copy of an object is generated, the freshly created object contains an exact copy of the values in the copied object. If a variable of the copied object is a reference to another object, then just the reference address of the object is copied |
| deep copy         | A deep copy occurs when an object is copied along with the objects to which it refers |



Today in modern languages, variables tend to be of 'reference types'. The variables value is technically the reference itself, not the referred object, which technically falls under pass-by-value.

However, the net effect on the program can be the same as either pass-by-value or pass-by-reference.

If a reference is just taken from a caller's variable and passed as an argument, this has the same effect as pass-by-reference: if the referred object is *mutated* in the callee, the caller will see the change.

```ruby
def a_method(param)
  # this is the callee
  param << ' there'
end

a = 'hi'
# the caller
a_method(a) # => 'hi there'
```



However, if a variable holding this reference is *reassigned*, it will stop pointing to that object, so any further operations on this variable will instead affect whatever it is pointing to now.

```ruby
def a_method(param)
  param = 'hello'  # variable holding reference is reassigned
  param << 'there' # mutation will not affect original referenced object
end

a = 'hi'
a_method(a) # => 'hi'
```



To have the same effect as as pass-by-value, a copy of the object is made at some point.

1. The caller can just make a private copy before the call and give the callee a reference to that instead. 

```ruby
def a_method(param)
  param << ' there'
end

a = 'hi'
b = a.dup
a_method(a)
p a # => 'hi there'
p b # => 'hi'
```



2. Object types that are immutable: any operation on them that seems to alter the value actually creates a completely new object without affecting the original one. 
   1. Passing an object that is immutable always has the effect of pass-by-value: a copy of the callee will be made automatically if and when it needs a change, and the caller's object will never be affected.