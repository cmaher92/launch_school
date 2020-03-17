# Practice Problem 1
#
# Given the array below
#
# Turn this array into a hash where the names are the keys and the values are
# the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# solution 1
# hash = {}
# flintstones.each_with_index { |v, i| hash[v] = i }
# p hash

# solution 2
# take the array and map each value to an array accompanied by it's index
# change the array of arrays to a hash
# I think this solution works, but it's less clearly understood in comparison
# to the first solution
# flintstones = flintstones.map.with_index do |v, i|
#   [v, i]
# end.to_h
#
# p flintstones

# solution 3
# each_with_obj
# forgot about ths method initially, browsed the Enumerable docs quickly to
# make sure I wasn't missing an obious method.. I was.
# I think I prefer this method personally but I believe that the first
# is still the easiest solution to read.
count = 0
flintstones = flintstones.each_with_object({}) do |value, hash|
  hash[value] = count
  count += 1
end
p flintstones
