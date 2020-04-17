# fizzbuzz.rb
# easy_8
# problem_6

# input: 2 integers
# output: print
# rules:
#   - print all numbers between the two integers
#   - if a number is divisible by 3, print Fizz
#   - if a number  is divisible by 5, print Buzz
#   - if divisibly by both, print FizzBuzz

require 'pry'
require 'pry-byebug'

# def fizzbuzz(first, second)
#   (first..second).each do |n|
#     case
#     when n % 3 == 0 && n % 5 == 0 
#       puts 'FizzBuzz'
#     when n % 3 == 0 
#       puts 'Fizz'
#     when n % 5 == 0
#       puts 'Buzz'
#     else
#       puts n
#     end
#   end
# end

# fizzbuzz(1, 15)

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end