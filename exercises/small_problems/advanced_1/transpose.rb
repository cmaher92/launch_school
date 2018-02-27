=begin
Transpose 3x3
A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array
and all of the sub-Arrays has 3 elements.

For example:
1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
An Array of Arrays is sometimes called nested arrays because each of the inner
Arrays is nested inside an outer Array.

To access an element in matrix, you use Array#[]
with both the row index and column index.
So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9.
An entire row in the matrix can be referenced by just using one index:
matrix[1] is the row (an Array) [4, 7, 2].
Unfortunately, there's no convenient notation for accessing an entire column.

The transpose of a 3 x 3 matrix is the matrix that results from exchanging the
columns and rows of the original matrix.

For example, the transposition of the array shown above is:
1  4  3
5  7  9
8  2  6

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns
the transpose of the original matrix.

Take care not to modify the original matrix:
you must produce a new matrix and leave the original matrix unchanged.
=end

# understanding the problem
# I need to take an array of arrays
# create a new array of arrays
# and turn each row into a column.
# the mathematical term for this is 'transpose'

# given an array of arrays
# set a new variable named transposed_matrix to an array of 3 empty arrays
# for each array on the passed in matrix array
# for each item in the og matrix's sub-arr
  # if the index is 0, append to the transposed array's 0th array
  # if the index is 1, append to the 1st array
  # if the index is 2, append to the 2nd array
# return the transposed matrix

require 'pry'

# my solution
# def transpose(matrix)
#   transposed_matrix = [[], [], []]
#   matrix.each do |row|
#     transposed_matrix[0] << row[0]
#     transposed_matrix[1] << row[1]
#     transposed_matrix[2] << row[2]
#   end
#   p transposed_matrix
# end

# instructor solution
# def transpose(matrix)
#   result = []
#   (0..2).each do |column_index|
#     binding.pry
#     new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
#     result << new_row
#   end
#   result
# end

# this solution is really clever because it doesn't directly iterate over
# either the matrix or the newly created transposed matrix.
# the solution uses ranges, beginning at 0 up to and including 2 which
# represents the column and the row.
# first each is called on the range (0..2) and the variable 'column_index'
# is passed into the block
# within the first block a new_row variable is set to the return value of
# mapping another range passing row_index into the block
# this causes the inner each method to access the matrix by using the
# following statement
# matrix[row_index][column_index]
# because the row_index is the inner loop the map will pass the row_index
# 3 times '0, 1, 2' into the map's block, but the column index will not chamge
# so map will be called 3 seperate times for each column index

# Here's my attempt at the instructors' solution
# def transpose(matrix)
#   result = []
#   (0..2).each do |column_index|
#     new_row = (0..2).map { |row_index| matrix[row_index][column_index]}
#     result << new_row
#   end
#   result
# end

# further exploration
# write a transpose! method that does in-place mutation of the matrix
# passed in.

# i need to manipulate the matrix in place and return it
# with each column now as the row
#   for the first three elements in each row
#     the first element should be appened to the first row,
#     the second element should be appeneded to the second row,
#     the third element should be appened to the final row
# return the matrix

# algorithm
# iterate over each row in the matrix, passing in the row
#   for each row
#     0.upto(2) passing in the number representing the index
#     shift the element, appending to the associated row
#  return the matrix

def transpose!(matrix)
  matrix.each do |row|
    0.upto(2) do |index|
      matrix[index] << row.shift
    end
  end
  matrix
end

# Test cases:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# This program should print "true" twice.

# NOTES:
# This is a good example of how you can iterate over something without
# directly iterating over the collection being used. It woud be helpful
# if I somehow kept a place for clever ways to work with objects.
