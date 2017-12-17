=begin
Right Triangles

Write a method that takes a positive integer, n, as an argument, 
and displays a right triangle whose sides each have n stars. 
The hypotenuse of the triangle (the diagonal side in the images below) 
should have one end at the lower-left of the triangle, and the other 
end at the upper-right.

input
  integer, n, positive
output
  prints a triangle
rules
  the triangle is a right triangle
  the hypotenuse of the triangle begins at the bottom left and extends to top
  
  given an integer
  print the triangle
    loop
      break when the counter is n
      print counter + 1 number of 
    end
=end

# original solution
# I had to correct for the upside down triangle, it worked but it wasn't easy
# to understand if somebody else had to read it. 
# def triangle(n)
#   counter = 0
#   stars   = n
#   tree    = []
#   loop do
#     break if counter == n
#     tree << "#{' '*counter}#{'*'*stars}"
#     counter += 1
#     stars   -= 1
#   end
#   tree.reverse.each { |layer| puts layer }
# end

# second attempt
=begin
  given an integer
  spaces = n - 1
  stars  = 1
  loop
    break when stars == n
    print the (' '*spaces) and ('*'*stars)
    decrement the spaces
    increment the stars
=end

def triangle(n)
  spaces = 0
  stars  = n
  loop do
    break if spaces == n
    puts "#{'*'*stars}#{' '*spaces}"
    spaces += 1
    stars  -= 1
  end
end

# [*, **, ***, ****, *****, ******, *******, ********, ]


# Examples:
triangle(5)

=begin
    *
   **
  ***
 ****
*****
=end

triangle(9)

#         *
#       **
#       ***
#     ****
#     *****
#   ******
#   *******
# ********
# *********

# Solution

# def triangle(num)
#   spaces = num - 1
#   stars = 1

#   num.times do |n|
#     puts (' ' * spaces) + ('*' * stars)
#     spaces -= 1
#     stars += 1
#   end
# end

=begin
Discussion
For this problem we have an inverse relationship between the number of spaces 
and the number of stars that should be printed on each line. 
If we are on the first line, we print num - 1 spaces and 1 star. 
If we are on the second line we print num - 2 spaces and 2 stars. And so forth.

We do just that by initially setting stars to 1, and spaces to num -1. 
On each iteration, we output the number of spaces and stars, and then we 
decrement the number of spaces and increment the number of stars. 
This will give us the desired result.

Further Exploration

Try modifying your solution so it prints the triangle upside down 
from its current orientation. Try modifying your solution again so 
that you can display the triangle with the right angle at any corner of 
the grid.
=end