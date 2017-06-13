# odd_numbers

# Print all odd numbers from 1 to 99, inclusive. 
# All numbers should be printed on separate lines.

# understanding the problem
# input
#   none
# output
#   print odd numbers from 1 to 99, inclusive

# algorithm
# loop over 1..99
#   if number.odd? puts number

# orig solution
# (1..99).each { |num| num.odd? ? (puts num) : next }

# further exploration
# 1.upto(99)     { |int| int % 2 == 1 ? (puts int) : next }

odd_numbers = (1..99).to_a.select { |num| num.odd? }
odd_numbers.each { |num| puts num }