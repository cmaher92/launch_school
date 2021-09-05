# What's My Value? (Part 4)

# What does the following code print, and why?

a = "Xyzzy"

def my_value(b)
  b[2] = '-'  # the []= method modifies the contents of the receiver
end

my_value(a)
puts a # => "Xy-zy"

=begin
- Line 11: the variable 'a' which references the value 'Xyzzy' is passed to the 'my_value' function
- Line 7: the variable 'b' is initialized and references the object containing the value 'Xyzzy'
- Line 8: The method #[]= is called by the object referenced by the 'b' variable, which is a string, 
  passing in the value 2. The String#[]= method is referred to as 'element assignment' and 
  returns a new string, 'Xyzzy'[2] = '-' returns '-'. Element assignment is mutating, 
- Line 12: The puts method is called, passing in the variable 'a', which references 'Xyzzy'.
=end