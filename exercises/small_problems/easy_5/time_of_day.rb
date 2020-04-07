# after midnight
# part 1
# easy_5

< integer
  - if positive, then its minutes after midnight
  - if negative, then its minutes before midnight
> string
  - time in 24 hour format (hh:mm)
! can be any length in time
! disregard daylight savings time
! hours 0-23
! minutes 0-59
~ calculate minutes in a day
  - 60 * 24, this number doesnt change so make it a constant
  - delta_minutes = time


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