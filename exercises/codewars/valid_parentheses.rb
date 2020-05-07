# Write a function called that takes a string of parentheses, 
# and determines if the order of the parentheses is valid. 
# The function should return true if the string is valid, and false if it's invalid.

# Examples
# "()"              =>  true
# ")(()))"          =>  false
# "("               =>  false
# "(())((()())())"  =>  true
# Constraints
# 0 <= input.length <= 100

# Along with opening (() and closing ()) parenthesis, 
# input may contain any valid ASCII characters. 
# Furthermore, the input string may be empty and/or not contain any parentheses at all. 
# Do not treat other forms of brackets as parentheses (e.g. [], {}, <>).

# input:
#   -string
# output:
#   - boolean; whether or not the order of parentheses is valid
# constraints:
#   - if close bracket ')' comes before an open, return false
#   - if not even number of open brackets, return false
#   - inputs may contain other valid ASCII characters
#   - input string may be empty and/or not contain any parentheses at all
#   - do not treat any other form of bracket as parentheses
# mental model:
#   - review each character in the given string
#   - keep track of number of open parentheses
#     - if number goes negative, means there is unmatched closing parentheses
#     - if number is not 0 at the end, means uneven number of parentheses
# algorithm/data structure:
#   - set number_open to 0
#   - iterate over each character in the string
#     - increment number_open if character is '('
#     - decrement number_open if character is ')'
#     - return false if number_open is negative
#   - return true if number_open is 0, false otherwise

def valid_parentheses(str)
  open = 0
  
  str.each_char do |char|
    if char == '('
      open += 1
    elsif char == ')'
      open -= 1
      return false if open < 0
    end
  end

  open == 0
end

p valid_parentheses("  (")      == false
p valid_parentheses(")test")    == false
p valid_parentheses("")         == true
p valid_parentheses("hi())(")   == false
p valid_parentheses("hi(hi)()") == true

