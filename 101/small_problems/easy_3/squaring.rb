# squaring an argument

# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument 
# (the square is the result of multiplying a number by itself).

# understanding
# input
#   single integer
# output
#   the result on the integer multiplied by itself

# algorithm
# call the multiply method with the integer provided to the square method

def multiply(int1, int2)
    int1 * int2
end

def square(int)
    multiply(int, int)
end

# Tests
puts square(5) == 25
puts square(-8) == 64

# What if we wanted generalize this method to a "power to the n" type method: 
# cubed, to the 4th power, to the 5th, etc. How would we go about doing so while 
# still using the multiply method?

# understanding
# input
#   number to find the power of: integer
#   number to decide which power to find: integer
# output
#   integer with the result

# algorithm
# keep an accumulator value
# take the which_power_num.times 
#   for each time call the multiply function with the number and save to
#   accumulator value
# return accumulator value

def power_to(power, number)
    result = number
    (power-1).times { result = multiply(result, number) }
    result
end

# Tests
puts power_to(2, 2) == 4
puts power_to(3, 3) == 27