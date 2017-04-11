# Write a method that takes one argument, a positive integer, and
# returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.
#
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Method that takes an int
# returns a string of alternating 1s and 0s, always starting with 1
# The length of the string should match the given int


def stringy(num)
  count = 0
  result = ''
  while count < num
    if count.even?
      result << '1'
      count += 1
    else
       result << '0'
      count += 1
    end
  end
  result
end

p stringy(9)

# # Jasons solution
# def stringy(int)
# 	(1..int).map { |n| n.odd? ? 1 : 0 }.join
# end
