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
  - Hash, to store the suffix endings
Algorithm
  - find century number
    - divide inputted num by 100
    - add 1
  - add century suffix
    - given any number, return the last two digits as an integer
      - if digits are between 11 and 13, pass into as themselves
      - otherwise, just pass the second digit
    - pass the two-digit integer into the endings map
  - output result string
=end

require 'pry'

SUFFIX_MAP = { 1 => 'st', 2 => 'nd', 3 => 'rd' }

def suffix(century)
  return 'th' if (century % 100).between?(11, 13)
  SUFFIX_MAP.fetch((century % 10), 'th')
end

def century(year)
  century = (year / 100) + 1
  century -= 1 if year % 100 == 0

  "#{century}#{suffix(century)}"
end


# Examples:
p century(2000) == '20th'
p century(1965) == '20th'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
p century(2001) == '21st'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'