=begin
Sum of Sums

Write a method that takes an Array of numbers and then returns the sum 
of the sums of each leading subsequence for that Array. You may assume 
that the Array always contains at least one number.

input
  array of numbers
output
  integer, sum of each leading sequence
rules
  always will contain at least one number
  
given an array of numbers
results = []
loop starting at 0, up to the length of the arr - 1
  skip iteration if count == 0
  results << arr[0..count].reduce(:+)
reduce the results, return sum
=end

def sum_of_sums(arr)
  result = 0
  1.upto(arr.size) do |idx|
    result += arr.slice(0, idx).reduce(:+)
  end
  result
end

# Test Cases
p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35