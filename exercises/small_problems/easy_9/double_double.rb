=begin
A double number is a number with an even number of digits whose left-side
digits are exactly the same as its right-side digits.
For example, 44, 3333, 103103, 7676 are all double numbers. 444,
334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument,
unless the argument is a double number; double numbers should be returned as-is.
=end

# input
# - integer
# output
# - intger

# given a number
# if the number is odd, return the number * 2
# if the number is even, check if it's a double number
# - turn the number to a string
# - retrieve the first half of the number
#   - half = str / 2
#   - string[0, half]
#   - string[half, half]
# - if the first half is equal to the second half, return num, otherwise num * 2

# def twice(num)
#   num_str = num.to_s
#   half    = num_str.size / 2
#   num_str[0, half] == num_str[half..-1] ? num : num * 2
# end

# Zac's answer
def twice(num)
  # He's dividing the number by the half-way point
  # So if it's 999999, he would divmod by 1000
  # This would be 999, 999 -> 999999
  # This is a great solution
  left, right = num.divmod(10**(num.digits.size / 2))
  left == right ? num : num * 2
end




# Examples:
p twice(0) == 0
p twice(8) == 16
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
# Note: underscores are used for clarity above.
# Ruby lets you use underscores when writing long numbers;
# however, it does not print the underscores when printing long numbers.
# Don't be alarmed if you don't see the underscores when running your tests.
