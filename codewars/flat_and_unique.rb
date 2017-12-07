=begin
  Given an array of arrays, write a method that returns a flattened array with all duplicate values removed.

  Example:
    flatAndUnique([[1,2,3], [1,4,5], ['a', 2, 'c'], ['a', 7]])

    => [1,2,3,4,5,'a', 'c', 7]

  You cant use the array.flatten method or the built in unique method

  input
    array of arrays
  output
    flattened array with only unique values
    

  given the array
  manually the array
    iterating over the array and adding all values into a new, flattened array
  remove non-unique values
    iterate over the array
    for the current_value I would check to see the count of that value
    if the value is > 1
  remove current value from the arr

  # select on the flattened_arr
  #   only return elements who's count is 1
    
  return the array


=end

# check the flattened_arr to see if item is in it
# if it's not push to arr

def flat_and_unique(arr)
  flattened_arr = []
  # 
  arr.each do |subarray|
    subarray.each do |item|
      flattened_arr << item unless flattened_arr.include?(item)
    end
  end
  p flattened_arr
  # flattened_arr.each do |obj|
  #   results.count(obj) == 0 ? results << obj : next
  # end
  # p results
end

flat_and_unique([[1,2,3], [1,4,5], ['a', 2, 'c'], ['a', 7]])
