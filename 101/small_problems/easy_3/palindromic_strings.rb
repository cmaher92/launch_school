# palindromic strings

# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and backward.
# For this exercsie, case matters as does punctuation and spaces.

# understanding
# input
#   string
# output
#   boolean, true if input string in palindrome false otherwise

# algorithm
# given the input string, take the string and reverse it
# if the string is equal, return true
# otherwise, return false
class Palindrome
  def palindrome?(str)
    str == str.reverse
  end

  # test cases
  puts "pass" if palindrome?('madam') == true
  puts "pass" if palindrome?('Madam') == false          # (case matters)
  puts "pass" if palindrome?("madam i'm adam") == false # (all characters matter)
  puts "pass" if palindrome?('356653') == true


  # understanding
  # input
  #   array
  # output
  #   boolean, true if the array is palandromic false otherwise

  # algorithm
  #   reverse the array given and check if its equal to original array
  # return boolean

  def palindrome_array?(arr)
    arr == arr.reverse
  end

  puts "pass" if palindrome_array?([1, 2, 1]) == true
  puts "pass" if palindrome_array?(["foo", "bar", "baz"]) == false

  # understanding
  # input
  #   string or array
  # output
  #   boolean whether or not the string/array passed in is palindromic

  # algorithm
  #   .reverse works on both str and array
  #   item == item.reverse

  def palindromic?(item)
    item == item.reverse
  end

  puts "pass" if palindromic?("sam mas") == true
  puts "pass" if palindromic?(['foo', 'bar', 'foo']) == true
  puts "pass" if palindromic?('foo bar baz') == false
end
