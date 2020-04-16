# input: array of ints
# output: average of ints
# rules:
#   - output is a float, rounded to 3 decimal places
#   - assume array is non-empty

def show_multiplicative_average(ints)
  puts "The result is #{"%.3f" % (ints.reduce(:*).to_f / ints.count)}"
end

p show_multiplicative_average([3, 5])
p show_multiplicative_average([6])
p show_multiplicative_average([2, 5, 7, 11, 13, 17])
