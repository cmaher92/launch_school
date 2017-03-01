# current factorial test

current_factorial = [1, 2]
highest_factor = 2
product = current_factorial.inject(:*)
while product != self
  current_factorial << current_factorial.last + 1
  product = current_factorial.inject(:*)
puts product
