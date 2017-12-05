def is_sorted_and_how(arr)
#     input
#       arr of integers
#     output
#       string, 'yes, ascending', 'yes, decending' or 'no'
  
    # given an array
    # loop the arr
    # => each loop should check the boolean against the result
    # => if the result is different, return 'no'
    # => increment
    # check the boolean, return proper associated string
    # counter = 0
    # result  = arr.fetch(counter) - arr.fetch(counter + 1)
    # result < 0 ? ascending = true : ascending = false
    # loop do
    #   break if counter == arr.size - 1
    #   if arr.fetch(counter) - arr.fetch(counter + 1) < 0 != ascending
    #     return 'no'
    #   end
    #   counter += 1
    # end
    # ascending ? 'yes, ascending' : 'yes, descending'
    arr == arr.sort ? 'yes, ascending' : arr == arr.sort.reverse ? 'yes, descending' : 'no'
    
end

p is_sorted_and_how([1, 2]) == 'yes, ascending'
p is_sorted_and_how([15, 7, 3, -8]) == 'yes, descending'
p is_sorted_and_how([4, 2, 30]) == 'no'