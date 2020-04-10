# cute angles

# input: float, represents an angle between 0 and 360 degrees
# output: string, represents that angle in degrees, minutes, and seconds

# rules
#   explicit requirements:
#     - Use a degree symbol to represent degrees ° (option + shift + 8)
#     - Use a single quote to represent minutes '
#     - Use double quotes to represents seconds "
#     - A degree has 60 minutes, while a minute has 60 seconds
#     - results may differ slightly depending on how you round values
#     - you sohuld use two digit numbers with keading zeros when formating the minutes and seconds
#   implicit requirements:
#     - if the integer passed in is above 360°, what do I do?
#       - divmod the inputted integer by 360, the remainder is the starting point
#     - how do I just get the number before decimal point
#       - to_i
#     - how do I get the number after decimal point
#       - take original number, subtract the to_i from it leaving you with float point after decimal
#     - how do I calc the minutes
#       - take the decimal and multiply it by 60, the number before decimal point is minutes
#     - how do I calc the seconds
#       - multiply decimal point after finding minutes to 60
#     - how do I format a leading 0?
#       - "%02d" % 7

# data structure
# array to hold numbers

# algorithm
# calculate degrees, minutes and seconds
#   - mod input by 360, result is angle
#   - degrees = angle.to_i
#   - minutes = ((angle - angle.to_i) * 60)
#     - seconds = minutes - minutes.to_i * 60
#     - mintes.to_i
#     - second.to_i
#   - format minutes and seconds
require 'pry'

DEGREE = "\xC2\xB0"

def dms(angle)
  angle = angle % 360
  degrees = angle.to_i.to_s
  minutes = (angle - angle.to_i) * 60
  seconds = (minutes - minutes.to_i) * 60
  minutes = "%02d" % (minutes.to_i)
  seconds = "%02d" % (seconds.to_i)
  %(#{degrees}#{DEGREE}#{minutes}'#{seconds}")
end


# test cases
# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°36'00")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# p dms(-40)
# p dms(-420)