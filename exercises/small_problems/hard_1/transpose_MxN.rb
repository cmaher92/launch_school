# Transpose MxN
=begin
In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.

Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. 
Any matrix can be transposed by simply switching columns with rows.

Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.
=end

# adjusted the break condition, as my previous solution didn't accurately account for 
# the fact that the number of columns in the new matrix would be based on the size of the
# given matrix row size. 

def transpose(matrix)
  new_matrix = []

  column = 0
  while column < matrix.first.size
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

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
