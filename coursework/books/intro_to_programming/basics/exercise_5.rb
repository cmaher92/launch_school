# Exercise 5
# Ruby Basics

# Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.

def factorial number
  array = []
  while number != 0
    array << number
    number -= 1
  end
  return array.inject(:*)
end

puts factorial 4
