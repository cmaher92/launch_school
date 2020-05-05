# Unlucky days

# input: Integer; year
# output: Integer; no. of unlucky days in given year
# rules:
# - unlucky day is friday the 13th
# - year is above 1752

# problem:
# find how to find a friday in a year
# - create a Time instance for given year
# - create a unlucky_days variable
# - 8600, seconds in a day, create constant
# - #friday? to check if current_day is friday
# - loop, adding 8600 seconds to current day
# - add 1 if current_day is a friday and mday is 13
# until current time's y-day
require 'pry'

SECONDS_IN_DAY = 86400

def friday_13th(year)
  current_day  = Time.new(year)
  unlucky_days = 0

  while current_day.year == year
    if current_day.friday? && current_day.mday == 13
      unlucky_days += 1
    end
    current_day = current_day + SECONDS_IN_DAY
  end

  unlucky_days
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
