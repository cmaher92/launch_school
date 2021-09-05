# What's My Value? (Part 1)

# What will the following code print and why?

a = 'cat'
puts a.object_id

def my_value(b)
  puts b.object_id

end

my_value(a)

=begin
Answer:
the value printed will be 7

Reason:
On line 5, the variable a is defined and assigned to the value 7.
On line 7..9 the function 'my_value' is defined
On line 11 'my_value' is called and passed the value 7, which is then assigned to the variable b on line 7.
On line 8, the variable b is then reassigned to the value of 10 + 7, 17. 17 is then returned and no action
  is taken on it.
On line 12, the variable a which was defined on line 5 is printed with the value of 7.


Discussion:
- Assignment operators like += do not mutate variables, instead it binds 
=end
