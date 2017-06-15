# leap years

# in the modern era under the Gregorian Calendar, leap yearas occur in every
# year that is evenly divisible by 4, unless the year is also divisible by 100.
# If the year is evenly divisble by 100, then it is not a leap year unless
# the year is evenly divisible by 400

# Assume the rule is good for any year greater than year 0. Write a method that
# takes any year greater than 0 as input, and returns true if the year is a leap
# year, or false if it is not.

# understanding
# input
#   integer: year
# output
#   boolean: based on if it is a leap year or not
# rules
# leap years occur
#   any year divisble by 4 unless also divisble by 100
#   any year that is evenly divisble by 100 unless the year is evenly divisible 400

# algorithm
# return true if year is divisble by 4 and not divisble by 100
# return true if year divisible by 400

def leap_year?(year)
  return true if (year % 4 == 0) && (year % 100 > 1)
  return true if year % 400 == 0
  false
end

# test cases
puts "pass 1"  if leap_year?(2016) == true
puts "pass 2"  if leap_year?(2015) == false
puts "pass 3"  if leap_year?(2100) == false
puts "pass 4"  if leap_year?(2400) == true
puts "pass 5"  if leap_year?(240000) == true
puts "pass 6"  if leap_year?(240001) == false
puts "pass 7"  if leap_year?(2000) == true
puts "pass 8"  if leap_year?(1900) == false
puts "pass 9"  if leap_year?(1752) == true
puts "pass 10" if  leap_year?(1700) == false
puts "pass 11" if  leap_year?(1) == false
puts "pass 12" if  leap_year?(100) == false
puts "pass 13" if  leap_year?(400) == true
