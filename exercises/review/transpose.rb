# transpose.rb

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# Details:
# - transpose means to flip a matrix on it's diagonal
# - the current columns become rows in the new matrix

# Requirements:
# - create a new object do not mutate
# - do not use Matrix class or Array#transpose method

# Steps:
# - Create an empty array that will hold the new matrix' rows
# - Create a new array for each column in existing matrix
#   - Calculate the number of columns
#   - Calculate the number of rows
#   - Iterate over each column of the matrix (outer loop)
#     -Iterate over each row of the matrix accessing each element at column_idx
#       - add that item to the new row array
# - Add that column to newly created array in step 1

def transpose(matrix)
  new_matrix = []
  columns    = matrix.first.size
  rows       = matrix.size

  (0...columns).each do |column_index|
      new_matrix << (0...rows).map { |row_index| matrix[row_index][column_index] }
  end

  new_matrix
end

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
