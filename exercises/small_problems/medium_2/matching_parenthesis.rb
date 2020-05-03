# Matching Parentheses
# Write a method that takes a string as argument, 
# and returns true if all parentheses in the string are properly balanced, 
# false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# < String
# > boolean; true if parenthis are matching, false otherwise
# ! ( ), true
# ! ) (, false - wrong direction
# ! '', true
# ! must see opening parenthesis ( , prior to seeing a closing

# open, close = 0
# if close is ever greater than open, return false
# if open, increment counter by 1
# if close, increment by 1
# if at the end, it's even, return true
require 'pry'

def balanced?(str)
  open, close = 0, 0
  str.each_char do |char|
    if %w(( )).include?(char)
      char == '(' ? open += 1 : close += 1
      return false if close > open
    end
  end
  open == close
end


# Examples:
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
# Note that balanced pairs must each start with a (, not a ).
