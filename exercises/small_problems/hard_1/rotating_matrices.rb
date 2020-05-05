# Rotating Matrices

=begin
As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. 
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
A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix 
is rotated clockwise by 90 degrees. For example, the 90-degree rotation of the matrix shown above is:

3  4  1
9  7  5
6  2  8

A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

3  4  1
9  7  5
is:

9  3
7  4
5  1
Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.
=end

# input: matrix
# output: matrix; rotated 90degrees
# rules:
# - rows count will be based on number of items in each row
# - columns count will be based on number of items in each row
# - each new row will be the first element in each row in existing matrix, beginning at last row

# algorithm:
# matrix[row][column]
# column = 0
# retrieve items in each matrix column, beginning at last row
# loop for each column
  # create new row for new_matrix
  # row, init at size of matrix - 1
  # loop for each row
    # add matrix[row][column] item to new_row
    # move down a row (decrement row variable)
    # break when row is less than 0
  # add new_row to new_matrix
  # column += 1
  # break when column is the size of the first matrix row
# return new_matrix
require 'pry'

def rotate90(matrix)
  new_matrix = []
  column = 0

  loop do
    new_row = []
    row = matrix.size - 1

    loop do
      new_row << matrix[row][column]
      row -= 1
      break if row < 0
    end

    new_matrix << new_row
    column += 1
    break if column == matrix.first.size
  end

  new_matrix
end 

# Test cases
# 1
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix1 = rotate90(matrix1)

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]

# 2
matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]
new_matrix2 = rotate90(matrix2)
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]

# 3
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))
p new_matrix3 == matrix2
