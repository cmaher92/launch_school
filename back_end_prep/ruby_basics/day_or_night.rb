# Day or Night

daylight = [true, false].sample

def time_of_day(daylight)
  puts "It's daytime!" if daylight == true
  puts "It's nighttime!" if daylight == false
end

time_of_day(daylight)


