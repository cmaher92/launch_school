# What century is that?

# Write a method that takes a year as input and returns the century.
# The return value should be a string that begins with the century number,
# and ends with st, nd, rd, or th as appropriate for that number.
#
# New centuries begin in years that end with 01. So,
# the years 1901-2000 comprise the 20th century.

# understanding the problem
# input
#   int: year
# output
#   string: century
# rules
#   new centuries begin in years that end with 01,
#   1901-2000 is the 20th century

# algorithm
# find out the century from the provided int
#   divide the provided year by 100 and set as century
#   if the year modulo 10 returns > 0, add one to the century
#   else the century is correct
# add the suffix to the century
#   calculate century's last digit
#   calculate century's last two digits
#   if last_two > 10 && last_two < 20 convert and add a th
#   if the century's last digit ends in 1 convert and add a st
#   if the century's last digit ends in 2 convert and add a nd
#   if the century's last digit ends in 3 convert and add a rd
#   else convert and add a th

def century(year)
  century = year / 100

  # check to see if the century needs to increase by 1
  if year % 10 > 0
    century += 1
  end

  last     = century % 10
  last_two = century % 100

  if last_two > 10 && last_two < 20
    century.to_s << 'th'
  elsif last == 1
    century.to_s << 'st'
  elsif last == 2
    century.to_s << 'nd'
  elsif last == 3
    century.to_s << 'rd'
  else
    century.to_s << 'th'
  end

end

# test cases
puts century(2000)  == '20th'
puts century(2001)  == '21st'
puts century(1965)  == '20th'
puts century(256)   == '3rd'
puts century(5)     == '1st'
puts century(10103) == '102nd'
puts century(1052)  == '11th'
puts century(1127)  == '12th'
puts century(11201) == '113th'
