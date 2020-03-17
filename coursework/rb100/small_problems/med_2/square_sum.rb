# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of 
# the first n positive integers and the sum of the squares of the first n 
# positive integers.

=begin 
input/output/rules
input - integer
output - integer
rules - 

summary
compute difference between 
- square of the sum of the first n positive integers
- sum of the squares of the first n positive integers

Given an integer
if the integer is less than 0, return 0
find the square of the sum of the first n positive integers
  create an array of all the numbers up to n
  sum the array
find the sum of the squares of the first n positive integers
  create an array of all the numbers up to and including n
  map each number in the array to the number squared
  sum the array
find the difference
  take the results and subtract sum of integers by sum of the squares
return the difference  
  
algorithm
return 0 if n < 0
set integers_to_n to a local variable poiting to an empty array
loop from 1 to n passing the num
  append each num to integers_to_n

square_of_sum = numbers_to_n.reduce(:+)**2

set integers_to_n_squared as the return value of mapping integers_to_n to their squared values
set sum_of_squares to the return value by reducing the array with addition

subtract square_of_sum by sum_of_squares and return 
=end

def sum_square_difference(n)
  return 0 if n < 0
  numbers_to_n = []
  1.upto(n) do |num|
    numbers_to_n << num
  end
  
  square_of_sum = numbers_to_n.reduce(:+)**2
  integers_to_n_squared = numbers_to_n.map { |num| num**2 }
  sum_of_square = integers_to_n_squared.reduce(:+)
  
  square_of_sum - sum_of_square
end 
# Test cases
p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
p sum_square_difference(-99) == 0