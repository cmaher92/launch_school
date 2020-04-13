# practice problem 1

# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

# sorted = arr.map(&:to_i).sort { |a, b| b <=> a }.map(&:to_s)
# or
sorted = arr.sort { |a, b| b.to_i <=> a.to_i }
p sorted