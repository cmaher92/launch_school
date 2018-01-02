# Unlucky Days
# Write a method that returns the number of
# Friday the 13ths in the year given by an argument.
# You may assume that the year is greater than 1752
# (when the United Kingdom adopted the modern Gregorian Calendar)
# and that it will remain in use for the foreseeable future.

# input
#   integer - representing a year
# output
#   integer - number of Friday the 13ths in a given year
# rules
#   you can assume the year is after 1752

require 'Date'

# create date object with the given integer
# loop 365 times
  # if date is a friday, and date is the 13th of the month
  # add 1 to unlucky_days variable

def friday_13th(year)
  date = Date.new(year)
  unlucky_days = 0
  365.times do
    date = date + 1
    if date.friday? == true && date.mday == 13
      unlucky_days += 1
    end
  end
  unlucky_days
end

# Examples:
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
