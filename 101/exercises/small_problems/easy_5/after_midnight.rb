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

# 1440 minutes in a day
def time_of_day(mins)
  # given the mins as either positive or negative
  # if the mins are more than a day, divmod by the mins in a day
  # if the mins are negative, convert to positive
  # now that we have the proper amount of minutes
  # divmod the minutes by 60
  # use string interpolation to return the result in hh:mm form
end


# Examples:
# time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"
# Disregard Daylight Savings and Standard Time and other complications.
