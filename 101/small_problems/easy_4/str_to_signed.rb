# convert a string to a signed number

require 'pry'

# In the previous exercise, you developed a method that converts simple numeric 
# strings to Integers. In this exercise, you're going to extend that method to 
# work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate 
# number as an integer. The String may have a leading + or - sign; 
# if the first character is a +, your method should return a positive number; 
# if it is a -, your method should return a negative number. 
# If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, 
# such as String#to_i, Integer(), etc. You may, however, use the string_to_integer
# method from the previous lesson.

def string_to_integer(str_num)
    string_to_ints = {
        '0' => 0, 
        '1' => 1,
        '2' => 2, 
        '3' => 3, 
        '4' => 4, 
        '5' => 5,
        '6' => 6,
        '7' => 7,
        '8' => 8,
        '9' => 9
    }
    arr = str_num.scan(/./) # seperates each item in the str into an array
    arr.map! { |num_str| string_to_ints[num_str] } # strs are now ints
    
    arr.inject { |value, digit| value * 10 + digit }
end

# understanding
# input
#   string of digits
# output
#   integers
# rules
#   if the first character is a +, return positive number
#   if the first character is a -, return negative number
#   if no sign is given, you should return a positive number
#   string will always contain valid number
#   no standard conversion methods

# algorithm
# convert the string into an array using the scan function
# decide if the number will be positive or negative
#   create a variable called negative that is a boolean
#   shift the first item from the string of digits
#   if the item is '+' then the number is positive
#   if the item is '-' then the number is negative
#   if the item is something else then the number is positive
# now pass the string of digits to the string_to_integer function
# change the integer to a negative number if the negative is true

# def string_to_signed_integer(digits)
    
#     negative = false
#     sign = digits[0]
    
#     if sign == '-'
#         negative = true
#         digits.delete!(sign)
#     elsif sign == '+'
#         negative = false
#         digits.delete!(sign)
#     end
    
#     digits = string_to_integer(digits)
#     if negative == true
#         digits/-1
#     else
#         digits
#     end
# end


# other solution
def string_to_signed_integer(string)
    case string[0]
    when '-' then -string_to_integer(string[1..-1])
    when '+' then string_to_integer(string[1..-1])
    else          string_to_integer(string)
    end
end

# further explanation
# refactor to only call string[1..-1] once and string_to_integer once
def string_to_signed_integer(string)
  begin
    integer = string_to_integer(string)
  rescue
    integer = string_to_integer(string[0..-1])
  end
  
  # take the string, and turn it into an integer without the first character
  # take the string, and turn it into an integer
end

# test cases
puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100