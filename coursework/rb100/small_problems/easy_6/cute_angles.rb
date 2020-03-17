# Cute angles
#
# Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a String that represents that
# angle in degrees, minutes and seconds.
# You should use a degree symbol (°) to represent degrees,
# a single quote (') to represent minutes, and a double quote (") to
# represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

# input
#   float that represents an angle between 0 and 360
# output
#   string that represents that angle in degrees minutes and seconds
# rules
#   ° to represent degrees
#   ' to represent minutes
#   " to represent seconds
#   ° has 60 minutes
#   min has 60 seconds
# if minutes or seconds less than 10 format with leading 0

# given a float
# calculate the degrees by divmod the input by 1
#   the quotient will be the degrees
#   the remainder will be the minutes and seconds
# calculate minutes and second
#   minutes, seconds = (remainder * 60).divmod(1)
#   seconds = seconds * 60
# format the strings
#   sprintf("%03d°%02d'%02d\"")

def dms(angle)
  negative = false
  angle > 360 ? angle = angle/360.0 : angle
  if angle < 0
    negative = true
    angle = angle.abs
  end
  degree, min_sec = angle.divmod(1)
  min, sec = (min_sec * 60).divmod(1)
  sec = sec * 60
  degree = -degree if negative == true
  sprintf("%02d°%02d'%02d\"", degree, min, sec)
end

# Test Cases
puts dms(76.73)# == %(76°43'48")
puts dms(254.6)# == %(254°36'00")
puts dms(93.034773)# == %(93°02'05")
puts dms(0)# == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(370.73)
puts dms(-76.73)
# Note: your results may differ slightly depending on how you round values,
# but should be within a second or two of the results shown.
#
# You should use two digit numbers with leading zeros when
# formatting the minutes and seconds, e.g., 321°03'07".
