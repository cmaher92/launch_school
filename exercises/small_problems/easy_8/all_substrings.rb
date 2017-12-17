=begin
All Substrings

Write a method that returns a list of all substrings of a string.
The returned list should be ordered by where in the string the substring
begins. This means that all substrings that start at position 0 should come
first, then all substrings that start at position 1, and so on.
Since multiple substrings will occur at each position,
the substrings at a given position should be returned in order from shortest
to longest.

You may (and should) use the substrings_at_start method you wrote in
the previous exercise:

input
  string
output
  array of every possible substrings
rules
  substrings will be ordered by index and then their length

given a string
init a results arr
loop beginning at 0 up to the length - 1
  loop again beginning at 1, up to the length - 1
  append to results arr if first_index is <= last_index
  this will prevent nil returns
return results arr
=end

def substrings(str)
  arr = []
  0.upto(str.size - 1) do |first_index|
    0.upto(str.size - 1) do |last_index|
      arr << str[first_index..last_index] if first_index <= last_index
    end
  end
  arr
end



# Test cases
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
