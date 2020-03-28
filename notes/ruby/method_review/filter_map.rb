# Enumerable#filter_map
# https://docs.ruby-lang.org/en/2.7.0/Enumerable.html#method-i-filter_map

# definition
# returns a new array containing the truthy results (everything except false or nil)
# it's like combining select and map, so instead of having to chain select and map
# you can now just used filter_map

# filter_map { |obj| block } → array
# filter_map → an_enumerator

# provided example
(1..10).filter_map { |i| i * 2 if i.even? } #=> [4, 8, 12, 16, 20]

# example from codewars problem string mix
# given two strings
# figure out the lowercase letters each string has, by saving to an array
# [letter, s1.count(letter), s2.count(letter)]
# then selecting only letters that have at least 2 for either string

def mix(s1, s2)
  hist = ('a'..'z').filter_map do |letter|
    [letter, s1.count(letter), s2.count(letter)] if s1.count(letter) > 1 || s2.count(letter) > 1
    # define the transformation action for each element, then define the selection action
    # the method returns an array only containing items that are truthy
  end
end

p mix("looping is fun but dangerous", "less dangerous than coding") 