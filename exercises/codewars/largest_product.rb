# Complete the greatestProduct method so that it'll find the greatest 
# product of five consecutive digits in the given string of digits.

# For example:
# greatestProduct("123834539327238239583") // should return 3240
# The input string always has more than five digits.

# Adapted from Project Euler.

# input:
#   - string: representing an integer of more than five digits
# output:
#   - integer: greatest product of five consecutive digits
# constraints:
#   -
# mental model:
#   - retrieve five integers
#   - multiply them and comapare product to greatest_product variable
#   - return greatest_prouct once found
# algorithm/data structure:
#   - set variable greatest_product to 0
#   - loop while start_index is 6 less than the size of the string
#     - retrieve 5 characters
#     - print

def greatest_product(n, start_index = 0, greatest_product = 0)
  while start_index < (n.length - 4)
    product = n[start_index, 5].chars.map(&:to_i).reduce(:*)
    greatest_product = product if product > greatest_product
    start_index += 1
  end
  greatest_product
end

def greatest_product(n)
  n.chars.map(&:to_i).each_cons(5).map { |arr| arr.reduce(:*) }.max
end

p greatest_product("123834539327238239583")
p greatest_product("02494037820244202221011110532909999")
