=begin
fizzbuzz

Write a method that takes two arguments: the first is the starting number, 
and the second is the ending number. Print out all numbers between the two
numbers, except if a number is divisible by 3, print "Fizz", if a number is 
divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, 
print "FizzBuzz".

input
  2 integers, starting and ending number
output
  print all numbers between starting and ending number
  if num is divisible by 3 equally print Fizz
  if num is divisible by 5 equaally print buzz
  if num is both divis by 3 and 5 equally print FizzBuzz


=end

def fizzbuzz(start, end_num)
  start.upto(end_num) do |num|
    case 
    when num % 5 == 0 && num % 3 == 0 then puts 'FizzBuzz'
    when num % 3 == 0 then puts 'Fizz'
    when num % 5 == 0 then puts 'Buzz'
    else
      puts num
    end
  end
end

# Example:

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz