# what century is that

require 'pry'
# Write a method that takes a year as iniput and returns the century
# The return value should be a string that begins with the century numbers
# and ends with st nd rd or th as appropriate for that number.

# new centuries begin in years that end with 01. So, the years 1901-2000
# comprise the 20th century

# input
#   integer - year
# output
#   string - the corresponding century
# rules
#   new centuries begin in years that end with 01
#     1901-200 is the 20th century
#   ends with st, nd, rd, or th as appropriate
#   1 = st
#   2 = nd
#   3 = rd
#   4 - 20 = th
#   21 = st
#   22 = nd

# algorithm
# calculate what century it is
#   take the input and divide by 100, giving you the century
#   add one to the output unless the original input % 100 == 1
# calculate what to add to the end of the century digit
    # if it's between 4 and 20 add th
    # if it ends in 1 add st
    # if it ends in 2 add nd
    # if it ends in 3 add rd

century_endings = { (4..20) => 'th', 1 => 'st', 2 => 'nd', 3 => 'rd' }

def century(year)
  century = year / 100
  century += 1 if (year % 100) > 1

  if (4..20).include?(century)
    century = century.to_s
    century  << 'th'
  elsif century % 10 == 0
    century = century.to_s
    century << 'th'
  elsif century % 10 == 1
    century = century.to_s
    century << 'st'
  elsif century % 10 == 2
    century = century.to_s
    century << 'nd'
  elsif century % 10 == 3
    century = century.to_s
    century << 'rd'
  end
  # binding.pry
  century
end


puts "pass" if century(2000)  == '20th'
puts "pass" if century(2001)  == '21st'
puts "pass" if century(1965)  == '20th'
# puts "pass" if century(256)   == '3rd'
# puts "pass" if century(5)     == '1st'
# puts "pass" if century(10103) == '102nd'
# puts "pass" if century(1052)  == '11th'
# puts "pass" if century(1127)  == '12th'
# puts "pass" if century(11201) == '113th'
