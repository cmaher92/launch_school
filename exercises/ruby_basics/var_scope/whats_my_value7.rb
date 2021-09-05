# What's My Value? (Part 7)

a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

=begin
Answer:

Explanation:
Line 3: the variable 'a' is initialized and assigned to reference the integer value 7
Line 4: the variable 'array' is initialized and assigned to reference an array object 
        containing the values '1', '2', and '3'.
Line 6..8: the #each method is called with a block on the 'array' variable. The block is called
           on each element of the receiver, in this case the block assigns the element to the 
           variable 'element' and then on line 7 reassigns the variable 'a' to the element passed
           into the block. a is reassigned to 1, then a is reassigned to 2, then finally a is reassigned
           to 3.
Line 10: The variable 'a' which now references the value '3' is printed.
=end