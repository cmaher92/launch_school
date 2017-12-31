# Matching Parentheses?
# Write a method that takes a string as argument,
# and returns true if all parentheses in the string are properly balanced,
# false otherwise. To be properly balanced,
# parentheses must occur in matching '(' and ')' pairs.

# input
#   string
# output
#   boolean, parentheses are balanced

# initialize local variable as 0
# iterate over the string after splitting into array
#   return false if the count is negative
#   +1 to count if it's an open parentheses
#   -1 to count if it's a closed parentheses
# count == 0

# Further Exploration
# There are a few other characters that should be matching as well.
# Square brackets and curly brackets normally come in pairs.
# Quotation marks(single and double) also typically come in pairs
# Can you expand this method to take into account those characters?

# 'connor)

# take the string and find if the string has any quotations (single/double),
# brackets, parentheses, curly braces.
# retrieve the matching elements from the string
# take those matching elements and iterate of each one
#   call balanced? on each one, checking to see if any of the elements are not
#   balanced, if one isn't balance return false
# return true if all matching elements have been checked for balance
require 'pry'
MATCH_CHARS = {'(' => ')', '[' => ']', "{" => "}"}

def is_balanced?(str, match_item)
  if match_item == "'" || match_item == "\""
    return str.count(match_item).even?
  end
  if MATCH_CHARS[match_item]
    opened_match = match_item
    closed_match = MATCH_CHARS[match_item]
  else
    opened_match = MATCH_CHARS.key(match_item)
    closed_match = MATCH_CHARS[opened_match]
  end
  balance = 0
  str.chars.each do |char|
    return false if balance < 0
    balance += 1 if char == opened_match
    balance -= 1 if char == closed_match
  end
  balance == 0
end

# quotes_balanced?(str, '\'')

def balanced?(str)
  str.scan(/[()\[\]{}'"]/).all? do |item|
    # binding.pry
    is_balanced?(str, item) == true
  end
end

# Test cases
p balanced?("conn'or")  == false
p balanced?('con[n]]or') == false
p balanced?('co{nno}r') == true
p balanced?("how are 'you today?") == false
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('`What` (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
