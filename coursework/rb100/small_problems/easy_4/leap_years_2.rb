# Leap Years (Part 2)

# A continuation of the previous exercise.

# The British Empire adopted the Gregorian Calendar in 1752, which was a leap 
# year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, 
# leap years occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous exercise to 
# determine leap years both before and after 1752.

# input
#   integer: year
# output
#   output: boolean

require_relative 'leap_years'  
  
# given a year
#   if the year is after 1752
#     call leap_year(year)
#   otherwise
#     modulo leap year by 4 and if there is no remainder return true
    
def greg_leap_year?(year)
  if year > 1752
    leap_year?(year)git add
  else
    year % 4 == 0
  end
end
  
puts greg_leap_year?(2016) == true
puts greg_leap_year?(2015) == false
puts greg_leap_year?(2100) == false
puts greg_leap_year?(2400) == true
puts greg_leap_year?(240000) == true
puts greg_leap_year?(240001) == false
puts greg_leap_year?(2000) == true
puts greg_leap_year?(1900) == false
puts greg_leap_year?(1752) == true
puts greg_leap_year?(1700) == true
puts greg_leap_year?(1) == false
puts greg_leap_year?(100) == true
puts greg_leap_year?(400) == true

















# Solution

# def leap_year?(year)
#   if year < 1752 && year % 4 == 0
#     true
#   elsif year % 400 == 0
#     true
#   elsif year % 100 == 0
#     false
#   else
#     year % 4 == 0
#   end
# end
# Discussion

# The change to the original leap_year? function is quite small; just one 
# additional if clause at the beginning of the method.

# Further Exploration

# Find a web page that talks about leap years or the different calendar systems, 
# and talk about the interesting information you learned. For instance, how was 
# the change from the Julian calendar to the Gregorian calendar handled in your 
# ancestral lands? Do they even use these calendar systems? If you live someplace 
# that doesn't use the Gregorian calendar, tell us about your calendar system.

# I learned the knuckle trick to finally remember how many days are in a month. 
# Also, the last country to change over to Gregorian calendar was Greece within
# Europe
# Most countries will use the Gregorian calendar for civil purposes. 