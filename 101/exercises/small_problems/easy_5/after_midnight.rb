# After Midnight (Part 1)
#
# The time of day can be represented as the number of minutes before or after
# midnight. If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.
#
# Write a method that takes a time using this minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with
# any integer input.
#
# You may not use ruby's Date and Time classes.

# given an integer that could be positive or negative representing minutes
#   initialize a local variable representing hour
#   initialize a local variable representing minutes
#   calculate total hours and minutes
#   create an array with the first element representing hours and second mins
#   case minutes <=> 0
#   when negative, subtract from array
#   when posituve, add to array
#   otherwise, do nothing to array
#   convert the time into a string in (hh:mm) format
#     map accordingly
#

require 'pry'
def time_of_day(mins)
  time = [0, 0]
  hours, minutes = mins.abs.divmod(60)
  if hours > 24
    days, hours = hours.divmod(24)
  end
  binding.pry
  case mins <=> 0
  when -1 then time[0] = 24 - hours && time[1] = 60 - minutes
  end
  puts time.inspect
end

#
# Examples:
# time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"
# Disregard Daylight Savings and Standard Time and other complications.
