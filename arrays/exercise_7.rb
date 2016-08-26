# exercise 7
# Write a program that iterates over an array and builds a new array
# that is the result of incrementing each value in the original array
# by a value of two
# print both arrays to the screen

# First attempt
a = [1, 2, 3, 4, 5]
puts a.map{ |item| item + 2 }
puts a

# Actual solution
new_array = []
a.each do |item|
  new_array << item + 2
end

p a
p new_array
