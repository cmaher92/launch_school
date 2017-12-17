=begin
Leading Substrings

Write a method that returns a list of all substrings of a string that start
at the beginning of the original string. The return value should be arranged
in order from shortest to longest substring.

input
  string
output
  returns list of all substrings of given string

given a string
init results array
loop to to the length of the string
add each substring to a results array using slice method
return results array

=end

# initial solution using #slice and a #upto
def substrings_at_start(str)
  results = []
  1.upto(str.size) do |length|
    results << str.slice(0, length)
  end
  results
end

# Examples:
p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
