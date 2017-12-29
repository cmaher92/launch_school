[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# map is called by an array of arrays
# a local variable 'arr' is defined by the block being passed to map
#   map is called again on the 'arr'
#   the block defines the local variable 'el' which could be either
#     an array or an integer
#     the el calls to_s which returns the element as a string
#     the string returned by to_s then calls size
#     the size is used to compare against the inter 1, if it's equal
#       the element is an integer, and is incremenet to 1
#       the incremented integer is then returned to the block execution
#       the block's returns the integer to map
#       the map function then returns the transformed array to the outer block
#       the outer block returns the transformed array to the outter map
#     if the .to_s.to_i does not match, another #map is called by the
#     inner-most array
#     the block execution defines a local variable 'n'
#     n is incremented and returned within the block
#     the block returns the incremented value to the map function
#     the map then returns the transformed inner-most array
#    the next level block then returns the transformed array to the
#   outer-most block
#   this block then returns that transformed array to the outer-most map

# return value is
# => [[[2, 3], [4, 5]], [6, 7]]
