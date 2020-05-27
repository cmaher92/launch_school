# write a method that takes two arguments:
# - the first is the starting number
# - the second is the ending number
# Print out all numbers between the two numbers except if:
# - a number is divisible by 3, print 'Fizz'
# - a number is divisible by 5, print 'Buzz'
# - a number is divisible by 3 and 5, print 'FizzBuzz"


# input:
#   - Integer– start number
#   - Integer- end number
# output:
#   - Array printed
# rules/constraints:
#   - divisible by 3, replace number with 'Fizz'
#   - divisible by 5, replace with 'Buzz'
#   - divisible by both, replace with 'FizzBuzz'
# algorithm/data structure:
#   - create a list of numbers from start..end
#   - map the list of numbers
#     - if the number is evenly divisible by 3 and 5, 'FizzBuzz'
#     - if number is evenly divisible by 3, 'Fizz'
#     - if number is evenly divisible by 5, 'Buzz'
#   - print out list of numbers

def fizzbuzz(x, y)
  arr = (x..y).to_a

  arr.map! do |n|
    case 
    when n%3 == 0 && n%5 == 0 then 'FizzBuzz' 
    when n%3 == 0             then 'Fizz'
    when n%5 == 0             then 'Buzz'
    else                           n
    end
  end
  
  puts arr.join(', ')
end

fizzbuzz(1, 15)
