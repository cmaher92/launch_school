# what century
# second attempt at making it more concise

# input
#   year
# output
#   string: century (ex: 19th)

# algorithm
# find the century based on the year
#   divide the century by 100 and add 1
#   unless century divided by 100 has no remainder then don't add 1
# find the suffix (function)
#   input
#     int: century
#   output
#     string: century suffix
# find the last digit from century modulos 10
# case last_digit
# when 1 then 'st'
# when 2 then 'nd'
# when 3 then 'rd'
# else 'th'
# return century

def suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0

  century.to_s + suffix(century)
end

# test cases
progress = 0
progress += 1 if century(2000)  == '20th'
progress += 1 if century(2001)  == '21st'
progress += 1 if century(1965)  == '20th'
progress += 1 if century(256)   == '3rd'
progress += 1 if century(5)     == '1st'
progress += 1 if century(10103) == '102nd'
progress += 1 if century(1052)  == '11th'
progress += 1 if century(1127)  == '12th'
progress += 1 if century(11201) == '113th'
puts "You passed #{progress} of 9 tests"
