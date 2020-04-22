# double doubles
# easy 9, problem 2

# < Integer
# > Integer
# ! a double number is a number with an even number of digits
#   whose left-side digits are exactly the same as the its right-side digits
# ! 44, 3333, 103103 are all double numbers
# ! if the input is a double number, return
# ! if the input isn't, double it and return
# & 
# given an integer
# check if it's a double number
#   - convert number to string
#   - if the length is odd, return false
#   - if it's even, divide the length by two
#     - init a local variable middle
#   - check if the first half of the string is the same as the second half
#     - slice from idx 0...half, then from half..-1
#     - compare strings
#     - if they are the same, return the number
#     # else double the number
# if it is, return the number
# if it isn't, return the number * 2

def twice(n)
  num_str = n.to_s
  return n * 2 if num_str.length.odd?
  middle = num_str.length / 2
  num_str[0...middle] == num_str[middle..-1] ? n : n * 2
end

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