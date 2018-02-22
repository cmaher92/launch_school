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

def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

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

# TODO
# now abstract top_rows and bottom_rows into a single recursive function
