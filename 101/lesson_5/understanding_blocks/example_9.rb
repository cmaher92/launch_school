[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

# a triple-level nested array calls the #map method, the return value
#   will be a modified array
# a block execution defines a local variable 'element1' which contains
#   a multi-dimensional array, the return value of the block will used by
#   the #map call to determine how to modified the array
# the multi-dimensional array calls the #each method, the return value will be
#   the original array
