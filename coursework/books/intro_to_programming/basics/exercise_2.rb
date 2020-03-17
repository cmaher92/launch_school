# Exercise 2
# Ruby Basics

# Use the modulo operator, division, or a combination of both to take a 4 digit number and find the digit in the thousands place, hundreds place, tens place.

def find_the_digit number
  if number / 1000
    thousands = number / 1000
    number = number - thousands*1000
    puts "thousands: #{thousands}"
  end
  if number / 100
    hundreds = number / 100
    number = number - hundreds*100
    puts "hundreds: #{hundreds}"
  end
  if number / 10
    tens = number / 10
    number = number - tens*10
    puts "tens: #{tens}"
  end
  if number / 1
    ones = number / 1
    puts "ones: #{ones}"
  end
end

find_the_digit 1999
