=begin
Sam is an avid collector of numbers. Every time he finds a new number he throws
it on the top of his number-pile. Help Sam organise his collection
so he can take it to the International Number Collectors Conference in Cologne.

Given an array of numbers, your function should return an array of arrays,
where each subarray contains all the duplicates of a particular number.
Subarrays should be in the same order as the first occurence of the number
they contain:

understanding the problem
input
  array of numbers
output
  array of arrays, each subarray contains all diplicates of that number
rules
  subarrays should be in the same order as the first occurence of the number
  they contain
  if the input is empty, return an empty array

create an array that will contain the diplicate numbers
start at the first number
  add that number to a new array
  check the array to see if there are any more
  add any others to that same array
  push that array to the array of duplicates

assign new local variable to duplicate_numbers which is an array
for each number in the passed in array
    create a new array for duplicates
    pass the number to a select statement
      select all numbers that equal the passed in number
    the result of the select statement should be assigned to the new array
    push this result to the duplicate_numbers array

bug
  numbers that have already been added to duplicate_numbers array
  are being added again once the outside #each statement reaches
  them

  skip if the current number is contained in any of the duplicate_numbers
  subarrays

  iterate over the duplicate_numbers using #any, passing the subarr to the block
    within the block, see if the first item in the subarr is equal to the num
    if it is, return true, otherwise return false

another approach
  The issue with this approach is that I had to add logic to repeatedly check
  to see if the number has already been added to the duplicate_numbers
  as a subarr, I feel that there should be a more effective way to accomplish
  this without having the checks in-place
=end

# def group(arr)
#   duplicate_numbers = []
#   arr.each do |num|
#     next if duplicate_numbers.any? { |subarr| subarr[0] == num }
#     duplicates = arr.select { |n| n == num }
#     duplicate_numbers << duplicates
#   end
#   p duplicate_numbers
# end

# Test cases
group([3, 2, 6, 2, 1, 3])
group([3, 2, 6, 2])
group([])
# >>> [[3, 3], [2, 2], [6], [1]]
# Assume the input is always going to be an array of numbers.
# If the input is an empty array, an empty array should be returned.
