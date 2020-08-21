# input
# - array
# - block
# output
# - new array containing elements that evaluate
#   to true

def select(arr)
  result = []
  counter = 0
  
  while counter < arr.size
    current_element = arr[counter]
    result << current_element if yield(current_element)
    counter += 1
  end
  
  result
end

p select([1, 2, 3]) { |num| num.odd? }
p select([1, 2, 3]) { |num| puts num }