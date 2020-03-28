# list of digits
# easy_1

# input
# integer
# output
# array containing all digits within the given integer
# 99 => [9, 9]

# def digit_list(num)
#   num.digits.reverse
# end

# given a number, for example 123
# create an array to store the digits
# call itself, until number is 0

def digit_list(num, arr=[])
  q, r = num.divmod(10)
  arr.unshift(r)
  # recursion
  digit_list(q, arr) if q != 0
  arr
end

p digit_list(12345)    == [1, 2, 3, 4, 5]     # => true`
p digit_list(7)        == [7]                     # => true
p digit_list(375290)   == [3, 7, 5, 2, 9, 0] # => true
p digit_list(444)      == [4, 4, 4] 
p digit_list(0)        == [0]