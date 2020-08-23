# input
# - sorted array of integers
# output
# - array of missing integers
# rules
# - missing integers must be in order

# create an array starting at the first item in input arr..last item
# create empty results array
# loop over new array
#   - for each item loop over input array and check if element is in it
#   - if element is, next
#   - if not, add to results array
# return results array

def missing(arr)
  results = []
  all_possible = (arr[0]..arr[-1]).to_a
  all_possible.each do |element|
    results << element unless arr.include?(element)
  end
  results
end

# tests
p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []