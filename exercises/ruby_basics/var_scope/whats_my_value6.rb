# What's My Value? (Part 6)

a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a



=begin
Answer:
'my_value': undefined local variable or method 'a' for main:object (NameError)

Explaination:
Line 9: the variable 'a' which references the value 7 is passed into the 'my_value' function
Line 5: the variable 'b' is initialized and assigned to point at the value that variable 'a' references, 
        in this case that value is 7.
Line 6: The variable 'a' is referenced and because 'a' does not exist within the scope of the 'my_value'
        method a NameError is returned, explaining that an undefined local variable 'a' is referenced.
=end