# Palindromic Numbers
#
# Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.
#
# input
#   - int
# output
#   - boolean

# given an int
# compare the int to the int reversed
# if it's the same return true
# otherwise return false

# def palindromic_number?(int)
#   int.to_s == int.to_s.reverse
# end

require_relative 'palindromic_strings'

# given an int
# turn int to string and pass to palindrome function
# def palindromic_number?(int)
#   palindrome?(int.to_s)
# end

# What happens when the int begins with one or more 0s
puts palindromic_number?(00100)
# ruby interprets 00100 as 64, as 00100 or 0100 is the octal representation
# of 64

# Because ruby uses 0, 0o to recognize a number as octal having multiple
# leading zeros it immediately saves it in it's decimal form.
# To avoid this problem it would be easiest to simply request that the user
# input a string, or enter a number without leading 0s.
# It's not the best solution, but it's the most pragmatic approach that I've
# found. 

# When turning an int to a string why does it return 64 when given 00100?
#

#
# Examples:
puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
