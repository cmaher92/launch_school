# two methods

# after_midnight
# input
# a string representing 'HH:MM'
# output
# integer, representing the minutes after midnight

# split the string on the semi-colon returning ['HH', 'MM']
# convert each element to integers

# multiply the first element by 12, and add it to the second element
# (time[0] * 60) + time[1]
require 'pry'

def after_midnight(t_str)
  time = t_str.split(':').map(&:to_i)
  time = (time[0] * 60) + time[1]
  time == 1440 ? 0 : time
end

def before_midnight(t_str)
  # given string representing time
  # call after_midnight to return the number of minutes after midnight
  # subtract mins after midnight from 1440 and return
  mins_after = after_midnight(t_str)
  mins_before = 1440 - mins_after
  mins_before == 1440 ? 0 : mins_before
end


p after_midnight('00:00')  == 0
p before_midnight('00:00') == 0
p after_midnight('12:34')  == 754
p before_midnight('12:34') == 686
p after_midnight('24:00')  == 0
p before_midnight('24:00') == 0