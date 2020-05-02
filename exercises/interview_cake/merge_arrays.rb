# Merge Arrays
# Interview cake problem

# In order to win the prize for most cookies sold, my friend Alice and I are going to merge our Girl Scout Cookies orders 
# and enter as one unit.

# Each order is represented by an "order id" (an integer).

# We have our lists of orders sorted numerically already, in arrays. 
# Write a method to merge our arrays of orders into one sorted array.

# Input: (2)Array of Integers
# Output: Array of Integers; merged
# ! output must be ordered numerically

# Algorithm
# create orders array
# loop until size of results array is same size as alices array
#   - grab each value at each array's index
#   - 10, 12
#   - 10 is smallest then added to results array
#   - increment the counter for the array where the element was added
#   - next
# return results
require 'pry'

def merge_arrays(arr_a, arr_b)
  orders = []
  index_a = 0
  index_b = 0

  until orders.size == (arr_a.size + arr_b.size)
    if arr_a[index_a] <= arr_b[index_b]
      orders << arr_a[index_a]
      index_a += 1
      if arr_a[index_a] == nil
        orders += arr_b[index_b..-1]
        break
      end
      next
    else
      orders << arr_b[index_b]
      index_b += 1
      if arr_b[index_b] == nil
        orders += arr_a[index_a..-1]
        break
      end
      next
    end  
  end

  orders
end

# For example:
my_array     = [3, 4, 6, 10, 11, 15]
alices_array = [1, 5, 8, 12, 14, 19]

== [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
