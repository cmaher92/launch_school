=begin
Multiply All Pairs

Write a method that takes two Array arguments in which each Array contains
a list of numbers, and returns a new Array that contains the product of every
pair of numbers that can be formed between the elements of the two Arrays.
The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

input
  2 arrays each contain a list of numbers
output
  new array that contains the product of every pair of numbers
  that can be formed between the elements of the two arrays

given two arrays
results = []

  loop up to the end of the array
    loop up to the end of the second array
      append the result of the outer loop's element * the inner loops element

return results
=end

def multiply_all_pairs(arr, arr2)
  results = []
  0.upto(arr.size - 1) do |idx|
    0.upto(arr2.size - 1) do |idx2|
      results << arr[idx] * arr2[idx2]
    end
  end
  results.sort
end

# Examples:
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
