# leap years

require 'pry'
# In the modern era under the Gregorian Calendar,
# leap years occur in every year that is evenly divisible by 4,
# unless the year is also divisible by 100.
# If the year is evenly divisible by 100,
# then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0.
# Write a method that takes any year greater than 0 as input,
# and returns true if the year is a leap year,
# or false if it is not a leap year.

# understanding the problem
# input
#   int: year greater than year 0
# output
#   boolean: based on if the year is a leap year or not
# rules
#   leap year
#     occur every year that is evenly divisble by 4
#     unless
#       divisble by 100 (but not 400)

# algorithm
# is the year divisible by 4
#   no
#     return false
#   yes
#     is the year divisible by 100 but not divisible 400
#       yes
#         return false
#     return true

# solution
# def leap_year?(year)
#   # checks if divisible by 4, if it isn't it's not a leap year
#   if !(year % 4 == 0)
#     false
#   elsif year % 100 == 0 && !(year % 400 == 0)
#     false
#   else
#     true
#   end
# end

# write an easier to read solution that handles the least likely case
# first

# algorithm
# is a year divisible by 400
#   then it is a leap year
# is a year divisible by 100
#   then it is not a leap year
# is a year divisible by 4
#   then it is a year leap year
# else
#   not a leap year

# cleaner solution guided by the solution from the book
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0 # will return bool
  end
end

# test cases
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
