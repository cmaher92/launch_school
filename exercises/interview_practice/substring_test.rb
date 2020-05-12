# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

# input:
#   - String
#   - String
# output:
#   - Boolean
# constraints:
#   - substring– string longer than two characters
#   - case does not matter
#   - 
# test input/output
#   -
# algorithm/data structure:
#   - find substrings with a consecutive length of 2
#     - set an index counter
#     - loop while index counter + 1 is less than the length of the 1st string
#     - return true if substring is in other substring
#   - if no substring from str matches str2, return false

def substring_test(str, str2)
  str, str2 = str.downcase, str2.downcase
  idx = 0
  while idx + 1 < str.length
    return true if str2.include?(str[idx..idx+1])
    idx += 1
  end
  false
end

p substring_test('BANANA', 'banana') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
