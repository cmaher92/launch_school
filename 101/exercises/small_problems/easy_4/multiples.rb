# Multiples of 3 and 5

# Write a method that searches for all multiples of 3 or 5 that lie between 1 
# and some other number, and then computes the sum of those multiples.
# For instance, 
# if the supplied number is 20, 
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# input
#   integer: upper multiple
# output
#   string: containing all the multiples between 3 and inputted integer
  
def find_multiples(num, max)
  arr      = []
  result   = 0
  iterator = 1
  # given a number and max
  # find the multiples of the num, up to the max
  until result >= max
    result = num * iterator
    if result > max
      break
    end
    arr << result
    iterator +=1 
  end
  arr
end

def multisum(num)
  arr_3 = find_multiples(3, num)
  arr_5 = find_multiples(5, num)
  arr_3.concat(arr_5).sort!.uniq!
  sum =  arr_3.reduce(:+)
  sum
end 

# # Examples
puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

# Solution

# def multiple?(number, divisor)
#   number % divisor == 0
# end

# def multisum(max_value)
#   sum = 0
#   1.upto(max_value) do |number|
#     if multiple?(number, 3) || multiple?(number, 5)
#       sum += number
#     end
#   end
#   sum
# end
# Discussion

# Our solution begins with a multiple? method that returns true if the given 
# number is an exact multiple of divisor, false if it's not. This method isn't 
# necessary, but it makes the multisum a bit more readable.

# multisum does nothing fancy; it rushes headlong into the problem, 
# and comes out the other end with the correct result. It adds each value 
# that is a multiple of 3 or 5 in the range to the sum variable.

# Further Exploration

# Investigate Enumerable.inject (also known as Enumerable.reduce), 
# How might this method be useful in solving this problem? 
# (Note that Enumerable methods are available when working with Arrays.) 
# Try writing such a solution. Which is clearer? Which is more succinct?
