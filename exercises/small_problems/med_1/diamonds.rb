# Diamonds!
# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.

# input
#   integer - represents the diamonds widest point
# output
#   puts a diamond

# given n
# build the rows up to n
# spaces = 8, stars = 1
# spaces = 6, stars = 3
# spaces = 4, stars = 5
# spaces = 2, stars = 7
# spaces = 0, stars = 9

# 4, 1, 4
# 3, 3, 3
# 2, 5, 2
# 1, 7, 1
# 0, 9, 0

def diamond(n)
  # init diamond arr, each element will be a string
  # stars = 1
  # spaces = n - 1
  # map each item of the diamond_arr
  #   str = create_str(stars, spaces)
  #   stars + 2
  #   spaces - 2
  #   str

  # given 9
  # stars = 1, spaces = 8
  # str = '    *    '
  # stars = 3
  # spaces = 6
  # str = '   ***   '
  # stars = 5
  # spaces = 4
  # str = '  *****  '
end

def create_str(stars, spaces)
  half_spaces = (' ' * (spaces / 2))
  stars = ('*' * stars)
  p half_spaces + stars + half_spaces
end


# [' ', ' ', ' ', ' ', '*', ' ', ' ', ' ', ' ']
# [' ', ' ', ' ', '*', '*', '*', ' ', ' ', ' ']


# def diamond(n)
#   # build the first
# end


# Examples
# diamond(1)

# *
# diamond(3)
#
#  *
# ***
#  *
# diamond(9)
#
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
