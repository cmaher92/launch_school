# rotating_matrices.rb
require 'pry'

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# non_square_matrix = [
#   [3,  4,  1],
#   [9,  7,  5]
# ]

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

def rotate90(matrix)
  rotated = []
  iterator = 0

  loop do
    break if iterator == matrix.first.size

    new_row = []

    matrix.each { |existing_row| new_row.unshift(existing_row[iterator]) }

    rotated << new_row

    iterator += 1
  end

  rotated
end

# p rotate_matrix_90(matrix)
# p rotate_matrix_90(non_square_matrix)

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
