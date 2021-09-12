# input
# - string
# output
# - boolean

# true if
# - all chars uppercase
# - empty string

# iterate through each character of the string
# - return false if downcase character present
# - true

def uppercase?(str)
  str.each_char { |char| return false if (97..122).include?(char.ord) }
  true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
