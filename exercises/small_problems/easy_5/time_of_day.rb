# after midnight
# part 1
# easy_5

require 'pry'

def time_of_day(minutes)
  hours, minutes = minutes.divmod(60)
  hours = hours % 24
  sprintf("%02d", hours) + ":" + sprintf("%02d", minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"