# The two oldest ages function/method needs to be completed.
# It should take an array of numbers as its argument and
# return the two highest numbers within the array.
# The returned value should be an array in the format [
# second oldest age, oldest age].
#
# The order of the numbers passed in could be any order.
# The array will always include at least 2 items.

# input: arr; ages
# output: arr; two oldest ages, youngest to oldest

def two_oldest_ages(arr)
  oldest_ages = []
  oldest_ages << arr.max
  arr.delete_at(arr.index(oldest_ages[0]))
  oldest_ages.unshift(arr.max)
  oldest_ages
end

# Test cases
p two_oldest_ages([1, 3, 10, 0]) # should return [3, 10]
p two_oldest_ages([61, 20, 100, 77, 54, 81, 41, 56, 46, 48, 83, 84, 100, 37, 39, 92, 49, 59])
