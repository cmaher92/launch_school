# fibonacci number location by length

# input: integer, number of digits
# output: integer

# rules:
#   explicit:
#     - fibonacci is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ..)
#       - first two numbers are 1, each subsequent number is the sum of the previous two
#     - need to access index of each fib number
#     - return the index of the first fibonacci number that has the number of
#       digits specified as an argument

# data_structure:
#   array

# algorithm:
#   generate fibonacci number until current number is number of digits
#     - loop, breaking when digits is equivalent to the inputted number
#     - init prev2, which holds the previous two numbers
#       - sum the prev2, setting as num
#       - assign prev2[1] to prev[0], assign num to prev2[1]
#       - set digits to the number of digits of num
#         - convert to array using #digits, then retrieve length of array
#       - break if digits == inputted digits

def find_fibonacci_index_by_length(num_of_digits)
  prev2 = [1, 1]
  digits = 1
  idx = 2
  until digits == num_of_digits
    fib = prev2.reduce(:+)
    prev2 = prev2[1], fib
    digits = fib.digits.length
    idx += 1
  end
  idx
end

# p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847