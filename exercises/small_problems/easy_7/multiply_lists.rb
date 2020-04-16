# input: 2 arrays of ints
# output: array combining the result of multiplying the two

# def multiply_list(list1, list2)
#   list1.each_with_index.map { |n, i| n * list2[i] }
# end

require 'pry'

# use zip to come up with one-liner
def multiply_list(list1, list2)
  list1.zip(list2).map { |e| e.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
