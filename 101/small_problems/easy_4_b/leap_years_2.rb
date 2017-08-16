# leap years (part 2)

# The British Empire adopted the Gregorian Calendar in 1752,
# which was a leap year.
# Prior to 1752, the Julian Calendar was used. Under the Julian Calendar,
# leap years occur in any year that is evenly divisible by 4.
#
# Using this information, update the method from the previous exercise
# to determine leap years both before and after 1752.

# understanding the problem
# input
#   int: year greater than 0
# output
#   boolean: is the year a leap_year or not
# rules
#   after 1752
#     if the year is divisible by 400 it is a leap year
#     if the year is divisible by 100 it is not (except if it's divis by 400)
#     if the year is divisible by 4 it is a leap year, not if it isn't
#   before 1752
#     if the year is divisible by 4 it is a leap year

# algorithm
# if year is >= 1752
#   leap_year_gregorian?(year)
# else
#   leap_year_julian?(year)
# end

def leap_year_gregorian?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0 # will return bool
  end
end

def leap_year_julian?(year)
  year % 4 == 0
end

def leap_year?(year)
  if year >= 1752
    leap_year_gregorian?(year)
  else
    leap_year_julian?(year)
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
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true
