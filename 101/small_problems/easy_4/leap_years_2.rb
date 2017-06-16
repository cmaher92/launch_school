# leap years 2


# The British Empire adopted the Gregorian Calendar in 1752,
# which was a leap year. Prior to 1752, the Julian Calendar was used.
# Under the Julian Calendar, leap years occur in any year that
# is evenly divisible by 4.

# understanding
# input
#   year
# output
#   boolean
# rules
#   Gregorian calendar from 1752 onwards
#   Julian calendar used before 1752
#   Julian calendar leap years occur in any year that is evenly divisible by 4

def leap_year?(year)
  if year >= 1752 # julian
    return true if year % 4 == 0
    false
  else
    case
    when year % 4   != 0 then false
    when year % 100 != 0 then true
    when year % 400 == 0 then true
    else
      false
    end
  end
end

# test cases
puts "pass 1" if leap_year?(2016) == true
puts "pass 2" if leap_year?(2015) == false
puts "pass 3" if leap_year?(2100) == false
puts "pass 4" if leap_year?(2400) == true
puts "pass 5" if leap_year?(240000) == true
puts "pass 6" if leap_year?(240001) == false
puts "pass 7" if leap_year?(2000) == true
puts "pass 8" if leap_year?(1900) == false
puts "pass 9" if leap_year?(1752) == true
puts "pass 10" if leap_year?(1700) == true
puts "pass 11" if leap_year?(1) == false
puts "pass 12" if leap_year?(100) == true
puts "pass 13" if leap_year?(400) == true
