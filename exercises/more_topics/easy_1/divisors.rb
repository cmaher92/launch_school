# Problem: Divisors
# Write a method that returns a list of all of the
# divisors of the positive integer passed in as an argument.
# The return value can be in any sequence you wish.

# input:
#   - int, positive
# output:
#   - array, list of all of the divisors of the input
# rules/constraints:
#   - input will be positive
#   - output can be in an order
# test input/output
#   -
# algorithm/data structure:
#   - create empty result array
#   - loop starting at 1
#     - break when divisor is great than input
#     - divide input, if remainder is 0 add to result list
#     - increment by 1

def divisors(n)
  result = []
  divisor = 1
  loop do
    break if divisor > n
    result << divisor if n % divisor == 0
    divisor += 1
  end
  result
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
