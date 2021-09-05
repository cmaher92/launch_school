# What's My Value? (Part 8)

array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

=begin
Explanation:
Line 3: the variable 'array' is initialized and assigned to reference the Array literal [1, 2, 3]
Line 5..7: the #each method is invoked and passed a block that with each iteration initializes and assigns
           the variable 'a' to the value that the variable 'element' references.
Line 9: the variable 'a' is passed into the #puts method which returns a NameError because 'a' is undefined
        within the current scope.
=end