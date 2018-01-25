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
    - I need to first count all of the top-level elements within
    the given array
      - add 1 right away regardless of what the element is
      - if the element is an array
        - call the function again, adding the return value to the count

  [1, 2, [3, 4]]
  item  = 1
  count = 1

  item  = 2
  count = 2

=end

def deep_count(a)
end

# Test cases
deepCount([1, 2, 3]);
//>>>>> 3
deepCount(["x", "y", ["z"]]);
//>>>>> 4
deepCount([1, 2, [3, 4, [5]]]);
//>>>>> 7
