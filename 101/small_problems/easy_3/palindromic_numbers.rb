# palindromic numbers

# Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.

# understanding
# input
#   integer
# outpout
#   boolean
# rules
#   number must read the same forwards and backwards

# algorithm
# reverse and compare the number to the original integer passed in
#   make it a string, reverse, make it an int and compare

def palindromic_number?(int)
  int == int.to_s.reverse
end


# test cases
puts "pass" if palindromic_number?(34543) == true
puts "pass" if palindromic_number?(123210) == false
puts "pass" if palindromic_number?(22) == true
puts "pass" if palindromic_number?(5) == true
puts "pass" if palindromic_number?(00005) == false
