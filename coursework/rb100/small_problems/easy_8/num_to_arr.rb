# Convert number to reversed array of digits

# Write a method that takes a positive integer as an argument
# and returns that number with its digits reversed

=begin
  input
    integer, positive
  output
    array with numbers reversed
  
  init arr
  given a number
    divmod(10) -> number, r
    append remainder to array
    repeat until number == 0
  return arr 
=end

# my solution, which according to the exercise is a less idiomatic way to
# accomplish the task
# def reversed_number(n)
#   arr = []
#   until n == 0
#     n, r = n.divmod(10)
#     arr << r
#   end
#   arr.join.to_i
# end

# further exploration
# turn into a 1-liner
def reversed_number(n)
  n.to_s.chars.reverse.join.to_i
end

# Test cases
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1