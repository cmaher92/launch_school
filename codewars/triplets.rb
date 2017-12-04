=begin
  Given an array of numbers find if any 3 numbers inside of the array
  can be multiplied to get the maximum number in the array.
  If the number is used once it can't be used again. If there are two same numbers
  then that number can be used 2 times.
=end

=begin
  given an array of numbers
  find subarrays of three elements
    each element within the subarray can't have repeated elements
  loop over the arr passing the element to the next loop
    loop again over the array starting at the 2nd element
      loop again over the array starting at the 3rd element
        combine the three elements into an array and append to results array
=end

=begin
My solution
def mult_of_three_nums(arr)
  results = []
  index = 0
  index.upto(arr.size) do |num|
    a = num
    (num + 1).upto(arr.size - 1) do |num|
      b = num
      (num + 1).upto(arr.size - 1) do |num|
        results << [arr[a], arr[b], arr[num]]
      end
    end
  end
  results.each do |subarray|
    return true if subarray.reduce(:*) == arr.max
  end
  false
end

# #  list_of_nums.combination(3).each do |sub_array|
#   until a.eql?(list_of_nums.size - 2)

#     prod = list_of_nums[a] * list_of_nums[b] * list_of_nums[c]
#     return true if prod.eql?(max)
#     if b.eql?(list_of_nums.size - 2) && c.eql?(list_of_nums.size - 1)
#       a += 1
#       b = a + 1
#       c = b + 1
#     elsif c.eql?(list_of_nums.size - 1)
#       b += 1
#       c = b + 1
#     else
#       c += 1
#     end
#   end
#   false
# end
=end


def mult_of_three_nums(arr)
  p arr.combination(3).to_a
end


p mult_of_three_nums([1,2,3,4,5,6]) == true
p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false
