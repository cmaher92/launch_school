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
    
def century(year)
  century = year / 100
  year % 100 == 0 ? century : century += 1
  # puts "year: #{year}, century: #{century}"
  case 
  when century == 11 then century.to_s + 'th'
  when century == 12 then century.to_s + 'th'
  when century == 13 then century.to_s + 'th'
  when century % 10 == 0 then century.to_s + 'th'
  when century % 10 == 1 then century.to_s + 'st'
  when century % 10 == 2 then century.to_s + 'nd'
  when century % 10 == 3 then century.to_s + 'rd'
  when century % 10 == 4 then century.to_s + 'th'
  when century % 10 == 5 then century.to_s + 'th'
  when century % 10 == 6 then century.to_s + 'th'
  when century % 10 == 7 then century.to_s + 'th'
  when century % 10 == 8 then century.to_s + 'th'
  when century % 10 == 9 then century.to_s + 'th'
  end
end
  

# Test Cases:
puts century(2000) == '20th'
puts century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

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

# First, notice a pattern about a century. It is equal to the current year divided by 100 plus 1. The exception to this is if the year is some multiple of 100. In that case, the century is the current year divided by 100.

# Next we need to understand which suffix to append for our century, the options being: 'th', 'nd', 'rd', 'st'. We decide which one to use by checking the last digit of the century. Though, before we do that, we do need to do one extra check. If the century's value mod 100 ends in either 11, 12, or 13, then we should return 'th'. Any other time, we can return a suffix determined by our case statement and the value of century % 10.

# Finally, we combine the string representation of the century with the correct suffix, and we have our answer.
