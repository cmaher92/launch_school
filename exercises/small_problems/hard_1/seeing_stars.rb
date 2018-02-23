# Seeing Stars
# Write a method that displays an 8-pointed star in an nxn grid, where n is an
# odd integer that is supplied as an argument to the method.
# The smallest such star you need to handle is a 7x7 grid.

# understanding the problem
# input
#   odd integer
# output
#   star printed in n*n grid
# rules
# the middle row is as many stars as n

# starting from the inside
#   inside row is n*stars
#   row on either side is 3 stars, centered on n
#   row outside of that is 3 stars, with one space between it

# create inside_row by multiplying * b n
# create middle_row by centering three stars on n
# recursively print until outer row is the length of n
  # given n
  #   insert a space at the 1st index and the last index
  #   print row
  # base case
  #   when the row is the same length of n
  # recursive case
  #   length is less than n
  #

# top rows
# given a number
# return if spaces == 0
# calculate spaces by n - 3
# now input spaces / 2 in "***" at the 1st index and the second to last
# print

require 'pry'

# outer rows function
#
# input
#   row, n
# output
#

# def top_rows(spaces, n)
#   return if spaces == 0
#   row = "***"
#   row.insert(1, ' ' * (spaces/2)).insert(-2, ' ' * (spaces/2))
#   puts row.center(n)
#   top_rows(spaces - 2, n)
# end
#
# def bottom_rows(row, n)
#   row.insert(1, ' ').insert(-2, ' ')
#   puts row.center(n)
#   row.size == n ? return : bottom_rows(row, n)
# end
#
# def star(n)
#   top_rows((n-3), n)
#   puts "***".center(n)
#   puts "*" * n
#   puts "***".center(n)
#   bottom_rows("***", n)
# end

# instructor solution
# star method
#   sets the max_distance variable to half of n, - 1
#   from max_distance down to 1
#     each block will be passed the distance, and n
#     calls print_row func
#   prints the middle of the star by multiplying the star by n
#   from 1 up to max_distance
#     each block will be passed the distance, and n
#     calls print_row func

# print_row
# input
#    n - the grid size
#    distance - distance from the center of the star
# sets the number_of_spaces to the distance - 1
# sets spaces to a space multiplied by number_of_spaces
# sets output to a new array containing 3 *'s
# joins the output with spaces previously defined, centers and then prints

require 'pry'

def print_row(n, distance)
  number_of_spaces = distance - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*')
  puts output.join(spaces).center(n)
end

def star(n)
  max_distance = (n - 1) / 2
  max_distance.downto(1) do |distance|
    print_row(n, distance)
  end
  puts '*' * n
  1.upto(max_distance) do |distance|
    print_row(n, distance)
  end
end

# notes
# I liked that the instructor utilized an array coupled with the join method
# that was a clever way to easily add spaces inbetween the stars opposed
# to using insert
# Also using the downto method was easily a better and more concise solution
# as opposed to using a recursive solution which ended up being too much
# for the problem as it seemed to require two seperate ones depending on
# whether or not it was the top of the star or the bottom of the star
# I'm still curious if I could abstract a simple recursive method that could
# recognize whether or not it was the top row or bottom row, but again
# it seems like it's simply overkill at this point.
# what would happen if I used the #format method opposed to string interpolation
# maybe overkill but it would serve as solid practice. 


# Examples
star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *
