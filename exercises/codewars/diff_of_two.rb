# [1, 2, 3, 4]  should return [[1, 3], [2, 4]]
require 'pry'

# def two_difference(lst)
#   # pairs array
#   # for each item in the lst
#     # see if the item + 2 is in the list as well
#     # if it is, add both to the pairs array
#   pairs = []
#   lst.each do |item|
#     pairs << [item, lst[lst.index(item+2)]] if lst.include?(item+2)
#   end
#   pairs
# end

def two_difference(lst)
  lst.each_with_object([]) { |num, pairs| pairs << [num, num + 2] if lst.include?(num + 2)}
end

# p two_difference([0, 3, 1, 4])

# arr = [369, 371, 866, 868, 605, 607, 431, 433, 299, 301, 452, 454, 282, 284, 514, 516, 433, 435, 945, 947, 825, 827]
# p two_difference(arr)

# p two_difference([1, 2, 3, 4]) == [[1, 3], [2, 4]]
p two_difference([1, 3, 4, 6]) == [[1, 3], [4, 6]]
p two_difference([0, 3, 1, 4]) == [[1, 3]]

# Expected:[
#   [369, 371], 
#   [866, 868], 
#   [605, 607], 
#   [431, 433], [299, 301], [452, 454], [282, 284], [514, 516], [433, 435], [945, 947], [825, 827]], 