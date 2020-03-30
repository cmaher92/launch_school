# palindromic strings 2

# - Input:
#   - String
# - Output:
#   - Boolean
# - Rules:
#   - case insensitive
#   - alphanumeric chars only
# - Data Structure:
#   - String
# - Abstraction:
#   - downcase string
#   - remove all non alphanumeric characters from string
# - Algorithm:
#   - gsub all non-alphanumeric, for nothing
#   - downcase

def real_palindrome?(str)
  str = str.scan(/[A-Za-z]/).join.downcase
  str == str.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false