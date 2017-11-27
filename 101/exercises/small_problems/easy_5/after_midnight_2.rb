# After Midnight (Part 2)
#
# As seen in the previous exercise, the time of day can be represented as the
# number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative,
# the time is before midnight.
#
# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively.
# Both methods should return a value in the range 0..1439.
#
# You may not use ruby's Date and Time methods.

# after midnight
# given a string representing the time 'hh:mm'
# set the variable for the result of parsing the string for the hours
# set the variable for the result of parsing the string for the minutes
# calculate the total minutes and return
#   multiply each hour by 60 and add to the minutes

require 'date'

MINUTES_PER_DAY = 1440
MIDNIGHT = '00:00'

def after_midnight(time)
  if time == '24:00'
    time = MIDNIGHT
  end
  date = DateTime.parse(MIDNIGHT)
  date = date.to_time
  new_date = DateTime.parse(time)
  new_date = new_date.to_time
  (new_date - date) / 60
end

def before_midnight(time)
  return 0 if time == '00:00' || time == '24:00'

  date = DateTime.parse(MIDNIGHT)
  date = date.to_time

  new_date = DateTime.parse(time)
  # puts the date a day prior
  new_date = new_date - 1
  new_date = new_date.to_time

  (date - new_date) / 60
end

def parse_time(time)
  time = time.split(':')
  time.map! { |element| element.to_i }
end

# How would these change if you were allowed to use Date and Time classes?
# create a date for midnight
# create a second date for the given time


#
# Test cases
puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
