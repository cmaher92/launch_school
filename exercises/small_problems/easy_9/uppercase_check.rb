# uppercase check
# easy 9, problem 5

# < String
# > Boolean
# ! true if all of the alphabetical characters inside the string are uppercase
# ! false otherwise
# &
#  check to see if the string matches any lowercase characters
#   if it does, return false, else true

def uppercase?(str)
  str.match?(/[a-z]/) ? false : true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true