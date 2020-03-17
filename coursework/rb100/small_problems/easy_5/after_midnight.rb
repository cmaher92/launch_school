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

require 'pry'
require 'date'

# create a DateTime object of midnight, today
# adjust the DateTime object based on the minutes passed in
# retrieve the hours and minutes from the adjusted DateTime object
# format("%02d:%02d", hours, minutes)
def time_of_day(mins)
  date = DateTime.new(2017, 11, 26, 0, 0, 0)
  case mins <=> 0
  when -1 then date = date - (mins.abs/1440.0)
  when +1 then date = date + (mins/1440.0)
  end

  hours = date.hour
  minutes = date.minute
  day_of_week = date.strftime('%A')
  "#{day_of_week} #{format("%02d:%02d", hours, minutes)}"
end


# Examples:
puts time_of_day(0) == "Sunday 00:00"
puts time_of_day(-3) == "Saturday 23:57"
puts time_of_day(35) == "Sunday 00:35"
puts time_of_day(-1437) == "Saturday 00:03"
puts time_of_day(3000) == "Tuesday 02:00"
puts time_of_day(800) == "Sunday 13:20"
puts time_of_day(-4231) == "Thursday 01:29"


# How would you approach this problem if you were allowed to use ruby's
# Date and Time classes? Suppose you also needed to consider the day of week?
# (Assume that delta_minutes is the number of minutes before or after midnight
# between Saturday and Sunday; in such a method, a delta_minutes value of -4231
# would need to produce a return value of Thursday 01:29.)
