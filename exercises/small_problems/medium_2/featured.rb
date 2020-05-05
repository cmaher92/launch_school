# Next featured number higher than a given value

# A featured number (something unique to this exercise)
# is an odd number that is a multiple of 7
# and whose digits occur exactly once each

# For example, 49 is a featured number
# 90 is not

# input: integer; 
# output: integer; next featured number after input
# rules:
# - must be odd number
# - must be multiple of 7
# - digits occur exactly once each

# algorithm:
# loop incrementing n
#   - check if n is odd && multiple of 7
#   - if it is, check for repeat digits
#     - if repreat no repeat digits, return n
#   - else, add 1 to n


def featured(n)
  loop do
    if n > 9999999999
      puts "There is no possible featured number greater than #{n}"
      break
    end
    n += 1
    if n.odd? && n % 7 == 0
      if n.digits.size == n.digits.uniq.size
        return n
      end
    end
  end
end

# Examples
# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999)
