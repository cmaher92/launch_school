# rb101/lesson 5/sorting
# require 'minitest/autorun'

# - comparison is at the heart of how sorting works
# - comparison is implemented with the '<=>' method sometimes referred to as the
#   'spaceship operator'
# - any object in a collection that we want to sort must implement a '<=>'
#   method

# What is returned?
5 <=> 5

# What is returned?
5 <=> 6

# What is returend?
5 <=> 4

# What is returned?
5 <=> '5'

# - The return value of '<=> is used by '#sort' to determine the order
#   in which to place the items. If '<=>' returns 'nil' to 'sort' then it
#   throws an error

# What is returned?
['a', 1].sort # => ArgumentError: comparison of String with 1 failed

# If you want to know how an object is compared during sorting, what do you
# look for?
# The <=> method implemented by that object

# What is returned?
'A' <=> 'a'

# ------
# Passing a block to the sort method

# What is returned?
[2, 5, 3, 4, 1].sort do |a, b|
  # a and b are the two items to be compared
  a <=> b
end
# => [1, 2, 3, 4, 5]

# How would you reverse the order?
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
# => [5, 4, 3, 2, 1]

# What is returned?
[0, 1, 2] <=> [0, 1, 3]
# => -1

# What is returned?
[1, 2, 3] <=> [1, 2, 3, 4]
# => -1

# What is returend?
[1, 2, 3] <=> [1, 2, 3]
# => 0

# What is returned?
['a', 1] <=> ['b', 2]
# => -1

# The sort_by method
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# => ['mat', 'bed', 'cot']

# Even though hashes aren't typically sorted as they are a key-value store
# they are ordered in ruby so if you wanted to sort, you can.
people = { Kate: 27, john: 25, Mike:  18 }
people.sort_by { |_, age| age }
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]
