# What's My Value (Part 2)

# What will the following code print, and why?

a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a

=begin
  
Answer:
- 7
- The newly defined object 'a' within the function 'my_value' shadows the object with the same
  name 'a' defined on line 5. The object passed into the function 'my_value' is then assigned and bound
  to a new object with the same name and returned. The puts method call on line 12 prints the value of
  the originally defined object which references a value of 7.

=end