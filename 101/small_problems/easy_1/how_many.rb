# how many

# write a method that counts the number of occurrences of each element in a
# given array.

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

# expected output
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# understanding the problem
# input
#   array
# output
#   each element alongside the number of occurances

# algorithm
# take the array and use the Array#count method

# solution
# doesn't account for returning a unique output, car is repeated 4 times
# def count_occurrences(arr)
#   arr.each { |element| puts "#{element} => #{element.length}" }
# end

# provided solution
def count_occurrences(arr)
occurences = {}
  arr.each do |element|
    occurences[element] = element.length
  end
  occurences.each { |element, count| puts "#{element} => #{count}" }
end

# test cases
count_occurrences(vehicles)

