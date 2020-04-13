# right triangles

# input: integer
# output: prints a right triangle
# rules:
#   hypotenuse - longest side of a right triangle, opposite the right angle
#   hypotenuse will run from the lower left to the upper right
#   prints n, n-1, n-2 stars each line
#   prints a total of n lines
# algorithm:
#   create a range from 1..n
#   itererate backwards over the range
#     print '*' * num rjusted to n

def triangle(n)
  (1..n).each { |stars| puts ('*' * stars).rjust(n) }
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********