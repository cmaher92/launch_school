# Convert a String to a Number!

# The String#to_i method converts a string of numeric characters 
# (including an optional plus or minus sign) to an Integer. String#to_i and 
# the Integer constructor (Integer()) behave similarly. In this exercise, 
# you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate 
# number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about 
# invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, 
# such as String#to_i, Integer(), etc. Your method should do this the old-
# way and calculate the result by analyzing the characters in the string.

# input
#   string of digits
# output
#   appropriate number 
# rules
#   all chars numeric
#   no leading signs to worry about
#   no standard conversion methods 
  
# given a string of digits
# create a hash for mapping strings to nums
# create an empty num which will be returned
# seperate all of the digits into an array
#   map each string number to the number using a hash
# map each item of the array to a number
# bring the array of nums to an int
#   if num is 0
#     set the num to the first element of the array
#     next
#   end
#   multiple the num * 10 and add the element
# return the num

require 'pry'

def string_to_integer(str)
  str_to_nums = {'1'=> 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                 '6'=> 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0}
 num = 0
 arr = str.split(//)
 arr.map! do |str|
   str_to_nums[str]
 end
 arr.each do |int|
   if num == 0
     num = int
     next
   end
   num = num * 10 + int
  end
  puts num
end

# Test cases
string_to_integer('4321') == 4321
string_to_integer('570') == 570