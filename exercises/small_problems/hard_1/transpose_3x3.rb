# transpose 3x3

=begin
A 3 x 3 matrix can be represented by an Array of Arrays 
in which the main Array and all of the sub-Arrays has 3 elements. 
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

The transpose of a 3 x 3 matrix is the matrix that results 
from exchanging the columns and rows of the original matrix. 
For example, the transposition of the array shown above is:
1  4  3
5  7  9
8  2  6

Write a method that takes a 3 x 3 matrix in Array of Arrays format 
and returns the transpose of the original matrix. 
Note that there is a Array#transpose method that does this -- you may not use it for this exercise. 
You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.
=end

# input: nested array; matrix
# output: nested array; transpose of inputted matrix

# algorithm:
# - matrix[row][column]
# - new_matrix = []
# - column = 0
# - loop for each column
  # - while column < matrix.size
  # - set row to 0
  # - grab each element in matrix[row][column] and add to new_matrix
    # - loop, break when row == size of matrix (while row < size of matrix)
    # - add each element to new_matrix
    # - row += 1
# - column += 1
# return new_matrix

def transpose(matrix)
  new_matrix = []

  column = 0
  while column < matrix.size
    new_row = []

    row = 0
    while row < matrix.size
      new_row << matrix[row][column]
      row += 1
    end

    new_matrix << new_row
    column += 1
  end

  new_matrix
end

# Examples
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
