# convert a str to a num

require 'pry'

#  The String#to_i method converts a string of numeric characters 
# (including an optional plus or minus sign) to an Integer. String#to_i and 
# the Integer constructor (Integer()) behave similarly. In this exercise, 
# you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate 
# number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about 
# invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, 
# such as String#to_i, Integer(), etc. 
# Your method should do this the old-fashioned way and calculate the result 
# by analyzing the characters in the string.

# understanding
# input
#   string of digits
# output
#   returns the appropriate number as an integer
# rules
# don't worry about leading + or - signs
# don't worry about invalid characters, assume all chars will be numeric

# algorithm
# seperate string into array
# create a hash mapping the strings representing the ints as key, value pairs
# map the array to the associated value
#   string_to_ints[element]
# join array and return

# def string_to_integer(str_num)
#     string_to_ints = {
#         '0' => 0, 
#         '1' => 1,
#         '2' => 2, 
#         '3' => 3, 
#         '4' => 4, 
#         '5' => 5,
#         '6' => 6,
#         '7' => 7,
#         '8' => 8,
#         '9' => 9
#     }
#     arr = str_num.scan(/./) # seperates each item in the str into an array
#     arr.map! { |num_str| string_to_ints[num_str] } # strs are now ints
    
#     arr.inject { |value, digit| value * 10 + digit }
# end

# # test cases
# puts string_to_integer('4321') == 4321
# puts string_to_integer('570') == 570

# further exploration
# write a hexadecima_to_integer method that converts a string representing
# a hexadecimal number to its integer value

# understanding
# input
#   string: hexadecimal number
# output
#   integer: number based on the string that was input
# rules

# algorithm
# seperate the string into an array using scan
# map each hex value to its decimal value
# convert to decimal
#   formula: ( sum + digit * 16^^x )
#   x starts at 0 and iterates += 1 each time

def hexadecimal_to_integer(hex_str)
    hex_to_decimal = {
        '0' => 0, 
        '1' => 1,
        '2' => 2, 
        '3' => 3, 
        '4' => 4, 
        '5' => 5,
        '6' => 6,
        '7' => 7,
        '8' => 8,
        '9' => 9,
        'a' => 10,
        'b' => 11,
        'c' => 12,
        'd' => 13,
        'e' => 14,
        'f' => 15
    }
    hex_array = hex_str.downcase.scan(/./)
    hex_array.map! do |hex_value|
        hex_to_decimal[hex_value]
    end
    hex_array = hex_array.reverse
    hex_array.map!.with_index do |hex_value, index|
        hex_value * 16**index
    end
    hex_array.inject(:+)
end


# test cases
puts hexadecimal_to_integer('4D9f') == 19871
puts hexadecimal_to_integer('9e42') == 40514