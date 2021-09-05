# What's My Value? (Part 5)

a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a # => "Xyzzy"

=begin
- Line 9: The method 'my_value' is called passing in the reference to the variable 'a'
- Line 5: The variable 'b' is initialized and assigned to reference the value that 'a' references
- Line 6: The variable 'b' is then reassigned to reference the string literal 'yzzyX'
- Line 10: The variable 'a' which references the String object with a value of "Xyzzy" is printed
=end