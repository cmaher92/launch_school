# transpose.rb

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# Details:
# - transpose means to flip a matrix on it's diagonal (a row becomes a column)
# - the current columns become rows in the new matrix

# Requirements:
# - modify transpose to work with any matrix of at least 1 row and 1 column

# Steps:


def transpose(matrix)
  new_matrix = []
  columns    = matrix.first.size
  rows       = matrix.size

  (0...columns).each do |column_index|
      new_matrix << (0...rows).map { |row_index| matrix[row_index][column_index] }
  end

  new_matrix
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
