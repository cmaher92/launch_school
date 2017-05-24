# list of digits

# understanding the problem
# input
#   positive integer
# output
#   array
#       list of digits of the input

# algorithm
# create an empty digits array
# take the number and loop over it breaking when the number == 0
#   divmod the number by 10 and save as number, remainder
#   

# solution
# def digit_list(num)
#     num.digits
# end

# solution
# def digit_list(num)
#     digits = []
#     loop do
#         num, remainder = num.divmod(10)
#         digits.unshift(remainder)
#         break if num == 0
#     end
#     digits
# end

# idiomatic ruby
def digit_list(num)
    num.to_s.chars.map(&:to_i)
end

# test cases
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]  