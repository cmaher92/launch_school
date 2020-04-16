# multiply all pairs
# easy_7
# problem_9

# input: 2 arrays of integers
# output: array of integers
# rules:
#   - returna a new array that contains the product of every pair of numbers that can be formed
#   between the elements of the two arrays
#   - results should be sorted by increasing value
#   - neither argument is an empty array

# algorithm:
#   - pair every number from both arrays together
#   - multiply them all
#   - return as a single array

# def multiply_all_pairs(nums1, nums2)
#   nums1.product(nums2).map { |e| e.reduce(:*)  }.sort
# end

# algorithm without using #product
# result
# iterate over first array
  # iterate over second array with an object
  # add element from first array and second array to the array from the each_with_object, multiplied

def multiply_all_pairs(nums1, nums2)
  result = []
  nums1.each do |num|
    nums2.each do |num2|
      result << [num, num2].reduce(:*)
    end
  end
  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]