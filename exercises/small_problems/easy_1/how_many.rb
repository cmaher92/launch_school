# how many?

# input
# array of strings, containing types of trucks
# output
# print vehicle => count
# the count is the number of times that string shows up in the arr
# 'car' != 'CAR'

# given an array
# tally the array, which returns a hash
# print the result

def count_occurrences(arr)
  # arr.tally.each { |v, t| puts "#{v} => #{t}" }

  arr.map { |v| v.downcase }.tally.each { |k, v| puts "#{k} => #{v}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)