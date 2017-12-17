=begin
Give us your feedback
Multiplicative Average

Write a method that takes an Array of integers as input, multiplies all the
numbers together, divides the result by the number of entries in the Array,
and then prints the result rounded to 3 decimal places.
Assume the array is non-empty.

input
  array of integers
output
  integer rounded 3 decimal places

# reduce the arr into the produce of all the elements divided
# divide the result by the size of the array turned to a float
# round the response the thousandths place

# issue
# if the result is a whole-number integer it doesn't add 3 zeros
# needed to format using #sprintf(format_string, args)
=end

def show_multiplicative_average(arr)
  puts format('%.3f', (arr.reduce(:*) / arr.size.to_f))
end

# def show_multiplicative_average(numbers)
#   product = 1.to_f
#   numbers.each { |number| product *= number }
#   average = product / numbers.size
#   puts format('%.3f', average)
# end


# Test cases
p show_multiplicative_average([3, 5])
# The result is 7.500

p show_multiplicative_average([6])
# The result is 6.000

p show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667
