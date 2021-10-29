# seeing stars

require 'pry'


# Details:
# - Write a method that displays an 8-pointed star in an n*n grid
# - n is an odd integer
# - the smallest star would be an n*n grid

# Input: n; integer; greater than 7

# Output:
# Requirements:
# - must be odd

# EXAMPLES
# n: 7


# DATA STRUCTURE
# [
#   ['', '', '', '', '', '', '', '', ''],
#   ['', '', '', '', '', '', '', '', ''],
#   ['', '', '', '', '', '', '', '', ''],
#   ['', '', '', '', '', '', '', '', ''],
#   ['', '', '', '', '', '', '', '', ''],
#   ['', '', '', '', '', '', '', '', ''],
#   ['', '', '', '', '', '', '', '', ''],
#   ['', '', '', '', '', '', '', '', '']
#   ['', '', '', '', '', '', '', '', ''],
# ]

# ALGORITHM
# 1. Create outer rows
#   - input: spaces (int)
#   - contains three stars separated by spaces (0..)
#   - centered and padded by spaces
# 2. Create bottom rows
#   - find half the size of num
#   -

def create_row(spaces, length)
  "*#{' ' * spaces}*#{' ' * spaces}*".center(length)
end

def star(num)
  outer_row_count = num / 2

  top_rows = (0...outer_row_count).to_a.reverse
  middle_row = ["#{'*' * num}"]
  bottom_rows = (0...outer_row_count).to_a

  star = []

  top_rows.each { |spaces| star << create_row(spaces, num) }
  star << middle_row
  bottom_rows.each { |spaces| star << create_row(spaces, num) }

  puts star
end

star(7)
star(9)
