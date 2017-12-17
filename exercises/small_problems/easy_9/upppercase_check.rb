# Uppercase Check
# Write a method that takes a string argument,
# and returns true if all of the alphabetic characters inside the string
# are uppercase, false otherwise
# Characters that are not alphabetic should be ignored.

def uppercase?(str)
  str = str.match(/[a-z]*/i).to_s
  str == str.upcase
end

# I think it would make sense for the function to return true for an empty
# string, the method is intended to simply check if a str is all uppercase
# letters, not to also check if it's empty.

# Examples:
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
