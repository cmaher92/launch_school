=begin
Given 2 strings, your job is to find out if there is a substring
that appears in both strings. You will return true if you find a
substring that appears in both strings, or false if you do not.
 We only care about substrings that are longer than one letter long.

input
  2 strings
output
  boolean
rules
  case-insensitive

[c o n n o r]

given two strings

split each string into substrings (method)
  loop for the start index
  start at 0, loop to the second to last element (arr - 2)
    loop for the end index
    start at 1, loop to last element (arr - 1)
    append each substring into a results arr
    if start_index is not less than end_index don't append

Now you have two arrays of substrings
  loop over one of the arrays
    check if the other array includes the substring
    if it does, return true

return false
=end

=begin
You need to only append when the start_index is less than the end_index
because when the start_index is = to the end_index or greater than the end_index
it'll return an empty string or only a single character in some cases
=end

def substring(str)
  results = []
  0.upto(str.length - 2) do |start_index|
    1.upto(str.length - 1) do |end_index|
      results << str[start_index..end_index] if start_index < end_index
    end
  end
  results
end

def substring_test(str, str2)
  substrings  = substring(str).map(&:downcase)
  substrings_2 = substring(str2).map(&:downcase)
  substrings.each do |substr|
    return true if substrings_2.include?(substr)
  end
  false
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
