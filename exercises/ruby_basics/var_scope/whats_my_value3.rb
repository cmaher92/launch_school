# What's My Value (Part 3)

# What will the following code print and why?

a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a

=begin

Answer:
- Line 5: the variable a is initialized and assigned to the integer value of 7
- Line 11: the variable a is referenced and the method integer method #+ is called passing the
  integer value of 5, returning a value of 12.
- Line 11: the my_value method is called passing the value of 12
- Line 8: the newly initialized variable 'a' is initialized and assigned to the variable 'b' which is
  12. 12 is returned.
- Line 12: The puts method is called passing in the variable 'a' which references the value 7.
=end