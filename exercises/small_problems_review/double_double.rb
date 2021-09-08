# double_double.rb

# double-number
# - must be an even number
# - when split in half, left side of digits is exactly the same as right side of digits
# - must be at least 2 digits

# double_num?
# - check if a given integer is a double-number, return boolean
# algo
# - covert to a string
# - find the size
#   - if size is less than two or is odd return false
# - find the middle index
#   - if it were a length of 4, divide by 2 and save to variable 'mid'
# - compare first half of string to second half
#   - slice string in half using element accessor method, #[]
#     - first_half will be from 0...mid, second_half from mid..-1
#     - if equivalent, return true else return false

def double_num?(n)
  num_str = n.to_s
  
  size = num_str.size
  
  return false if size.odd? || size < 2

  mid = size / 2

  return false unless num_str[0...mid] == num_str[mid..-1]
  true
end

def twice(n)
  return n * 2 unless double_num?(n)
  n
end

# p double_num?(37) == false
# p double_num?(44) == true
# p double_num?(444) == false
# p double_num?(103103) == true
# p double_num?(0) == false

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
