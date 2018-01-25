# Array#length will give you the number of top-level elements in an array.
# Your task is to create a function deepCount that returns the number
# of ALL elements within an array, including any within inner-level arrays.

=begin
  input
    - array of elements, some elements can be nested arrays, hashes
  output
    - integer, number of total elements
  rules
    - elements that contain other elements, 'nested elements' count as
    themselves in addition to all elements that are contained within the
    top-level element

  given an array
    - define local variable 'count' to track the number of elements
    - iterate over each element within the passed in array
      - if element is not an array
        - increase the count by 1
      - if the element is an array
        - increase the count by the return value of calling deep_count + 1
    - return count

=end

def deep_count(arr)
  count = 0
  arr.each do |el|
    if el.class != Array
      count += 1
    else
      count += 1 + deep_count(el)
    end
  end
  count
end

# Test cases
p deep_count([1, 2, 3]) == 3
p deep_count(["x", "y", ["z"]]) == 4
p deep_count([1, 2, [3, 4, [5]]]) == 7
