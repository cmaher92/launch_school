# time str to minutes

require 'pry'
require 'time'

# time
# create time for midnight tomorrow
# create time for time passed in
# subtract tomorrow from time
# if time is 1440, return 0, else return delta

# Raquel Nishimoto's solution
def after_midnight(time_str)
  time = Time.parse(time_str)
  (time.hour * 60) + time.min
end 

# def after_midnight(t_str)
#   midnight = Time.parse('00:00')
#   time_after = Time.parse(t_str)
#   delta = ((time_after - midnight) / 60).to_i
#   delta == 1440? 0 : delta
# end

# def before_midnight(t_str)
#   midnight = Time.parse("2020-04-09")
#   time = Time.parse(t_str)
#   delta = ((midnight - time) / 60)
#   delta == 1440 ? 0 : delta
# end

# solutions not using Date or Time classes
# def after_midnight(t_str)
#   time = t_str.split(':').map(&:to_i)
#   time = (time[0] * 60) + time[1]
#   time == 1440 ? 0 : time
# end

# def before_midnight(t_str)
#   # given string representing time
#   # call after_midnight to return the number of minutes after midnight
#   # subtract mins after midnight from 1440 and return
#   mins_after = after_midnight(t_str)
#   mins_before = 1440 - mins_after
#   mins_before == 1440 ? 0 : mins_before
# end


p after_midnight('00:00')  == 0
# p before_midnight('00:00') == 0
p after_midnight('12:34')  == 754
# p before_midnight('12:34') == 686
p after_midnight('24:00')  == 0
# p before_midnight('24:00') == 0