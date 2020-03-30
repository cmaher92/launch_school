# What Century is That?
# Write a method that takes a year as input and returns the century. 
# The return value should be a string that begins with the century number, 
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

=begin
Input
  - Integer, represents year
Output
  - String, the century of the inputted year
Rules
  - 1-99 is a century, 100 would be next century
  - divmod (year / 100)
    - if remainder is 0, don't add 1
    - if remainder is > 0, add 1
  - century endings
    - 0    -> th
    - 1    -> st
    - 2    -> nd
    - 3    -> rd
    - 4..9 -> th
Data Structure
Algorithm
  - find century number
    - divide inputted num by 100
    - add 1
  - find century ending
    - map last char to endings_map, if not in map append 'th'
  - return string

=end
require 'pry'

ENDINGS_MAP = { 1 => 'st', 2 => 'nd', 3 => 'rd' }

def century(year)
  c_num, rem = year.divmod(100)
  c_num += 1 unless rem == 0
  c_suffix = c_num.digits.first(2)
  "#{c_num}#{ENDINGS_MAP.fetch(c_suffix, 'th')}"
end


# Examples:
#p century(2000) == '20th'
#p century(1965) == '20th'
#p century(1052) == '11th'
#p century(1127) == '12th'
#p century(11201) == '113th'

p century(2001) #== '21st'
p century(256) #== '3rd'
p century(5) #== '1st'
p century(10103) #== '102nd'
