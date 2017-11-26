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

MINUTES_PER_DAY = 1440

def after_midnight(time)
  hours_minutes = parse_time(time)
  hours_minutes[0] = 0 if hours_minutes[0] == 24
  (hours_minutes[0] * 60) + hours_minutes[1]
end

def before_midnight(time)
  hours_minutes = parse_time(time)
  hours_minutes[0] = 0 if hours_minutes[0] == 24
  total_minutes = (hours_minutes[0] * 60) + hours_minutes[1]
  if total_minutes == 0
    return 0
  end
  MINUTES_PER_DAY % total_minutes
end

def parse_time(time)
  time = time.split(':')
  time.map! { |element| element.to_i }
end

#
# Test cases
puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
