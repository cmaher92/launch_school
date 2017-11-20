# Leap Years (Part 1)

# In the modern era under the Gregorian Calendar, leap years occur in every 
# year that is evenly divisible by 4, unless the year is also divisible by 100. 
# If the year is evenly divisible by 100, then it is not a leap year unless the 
# year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that 
# takes any year greater than 0 as input, and returns true if the year is a leap 
# year, or false if it is not a leap year.

# input
#   int: year
# output
#   boolean: whether or not it is a leap year
# rules
#   evenly divisible by 4
#     unless also divisble by 100
#       unless divisble by 400
      

# given a year
# if it's not divisble by 4, return false
# now if it's divisble by 100 but not divisible by 400 return false
# otherwise return true 

# def leap_year?(year)
#   return false if year % 4 != 0
#   return false if year % 100 == 0 && year % 400 != 0
#   true
# end

# def leap_year?(year)
#   (year % 400 == 0) || (year % 100 != 0 && year % 4 == 0)
# end

def leap_year?(year)
  leap_year = false
  leap_year = true if year % 4 == 0 
  leap_year = false if year % 100 == 0
  leap_year = true if year % 400 == 0
  leap_year
end
  
# Test cases
puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

# Solution and Discussion

# Solution

# def leap_year?(year)
#   if year % 400 == 0
#     true
#   elsif year % 100 == 0
#     false
#   else
#     year % 4 == 0
#   end
# end
# A shorter solution

# if the year is divisible by 400 then it's a leap year
# if the year is divisible by 100, but it's not
# now just check for divisible by 4

# def leap_year?(year)
#   (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
# end
# Discussion

# The first solution takes this one step at a time by testing for the least 
# common cases first; years divisible by 400, and years divisible by 100. If 
# the year is anything else, then it is a leap year if it divisible by 4.

# The second solution is more idiomatic, but also a little harder to read. 
# It is, in effect, identical to the first solution, although the tests are 
# turned around a little bit.

# Further Exploration

# The order in which you perform tests for a leap year calculation is important. 
# For what years will leap_year? fail if you rewrite it as:

# def leap_year?(year)
#   if year % 100 == 0
#     false
#   elsif year % 400 == 0
#     true
#   else
#     year % 4 == 0
#   end
# end

# It will fail if the year is divisible by 400, because false will have already
# been passed because if it's divisible by 400 it's also divisible by 100 and 
# it wont get further than the first if statement

# Can you rewrite leap_year? to perform its tests in the opposite order of the 
# above solution? That is, test whether the year is divisible by 4 first, then, 
# if necessary, test whether it is divisible by 100, and finally, if necessary,
# test whether it is divisible by 400. Is this solution simpler or more complex
# than the original solution?


# Rewrite leap year problem to perform its testse in the opposite order
# - test divisible by 4
# - test if necessary test whether it's divisible by 100
# - finally, if necessary, test whether it is divisible by 400
# - is it simpler or more complex?

# initialize a local variable set to false
#   if the year is evenly divisble by 4 set the local variable to true
#   then if the year is evenly divisible by 100 set to false 
#   finally if it's divisible by 400 set to true 
# return local variable 

# It involves creating a local variable and testing each case
# As far as reading is concerned it's a bit easeier to read
# but when it comes to whether or not it's a better solution it's probably not
# because it requires that each scenario is tested when the other solutuion
# eliminates as it progresses

