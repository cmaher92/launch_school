# What Century is That?

# Write a method that takes a year as input and returns the century. 
# The return value should be a string that begins with the century number,
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 
# comprise the 20th century.

# input 
#   integer: year
# output
#   string: century

  
# given a year
# calculate the century
#   - centuries start at 01 and end at 00 (1901 - 2000)
# append the proper ending
# rules
#   0 = th
#   1 = st
#   2 = nd
#   3 = rd
#   4-9 = th

#   edge
#   11 - 13 = th

# given a year
# calculate the century
# initialize a local variable and assign to an empty int
#   take the remainder of the year / 100 assign to local variable
#     if the year is evenly divided by 100 then don't increment
#     othewise incremenet by 1
# append the proper ending
#   if the local variable is 11 - 13
        # append th to the end
#   if the local variable ends in 0
#     return the century in string form with 'th' added to end
#   if the variable ends in 1 
    #   return the century with 'st' added to the end
    # if the variable ends in 2
    #   return 'nd' to the end
    # if the variable ends in 3 
    #   return 'rd' to the end
    # if the variable ends in 4-9
    #     return 'th' to the end 
    
# def century(year)
#   century = year / 100
#   year % 100 == 0 ? century : century += 1
#   # puts "year: #{year}, century: #{century}"
  
#   num = 0
#   century > 100 ? num = 100 : num = 10
#   if century < 14
#     suffix = century
#   else
#     suffix = century % num
#   end
  
#   case 
#   when [0, 4, 5, 6, 7, 8, 9, 11, 12, 13].include?(suffix)
#     century.to_s + 'th'
#   when suffix == 1
#     century.to_s + 'st'
#   when suffix == 2
#     century.to_s + 'nd'
#   when suffix == 3
#     century.to_s + 'rd'
#   end
  
# end

# adjust the case statement to handle centuries that are 3 digits
# for example the 113th century, is being % 10 and returning 3, adding
# the wrong ending

# num is determined by the number of digits in century
# if it's only 2 digits use 10
# otherwise use 100

# case century % num
# when 0, 4, 5, 6, 7, 8, 9, 11, 12, 13
  # add 'th'
# when 1
  # add 'st'
# when 2
  # add 'nd'
# when 3
  # add 'rd'
  
# century
# century is the year / 100 + 1
# century -= 1 if century % 100 == 0
# century.to_s + century_suffix(century)

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

# century_suffix
# return 'th' if [11, 12, 13].icnlude?(century % 100)
# find last digit
# case statement handling each

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10
  case last_digit
  when 1 then return 'st'
  when 2 then return 'nd'
  when 3 then return 'rd'
  else 'th'
  end
end
  

# Test Cases:
puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

# Solution and Discussion
# Solution

# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 == 0
#   century.to_s + century_suffix(century)
# end

# def century_suffix(century)
#   return 'th' if [11, 12, 13].include?(century % 100)
#   last_digit = century % 10

#   case last_digit
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end
# Discussion

# First, notice a pattern about a century. It is equal to the current year 
# divided by 100 plus 1. The exception to this is if the year is some multiple of 
# 100. In that case, the century is the current year divided by 100.

# Next we need to understand which suffix to append for our century, the
# options being: 'th', 'nd', 'rd', 'st'. We decide which one to use by checking 
# the last digit of the century. Though, before we do that, we do need to do one 
# extra check. If the century's value mod 100 ends in either 11, 12, or 13, then 
# we should return 'th'. Any other time, we can return a suffix determined by our 
# case statement and the value of century % 10.

# Finally, we combine the string representation of the century with the correct
# suffix, and we have our answer.
