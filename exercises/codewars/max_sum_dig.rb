# max_sumDig(2000, 3)
# => [11, 1110, 12555]
# 11 = 11 found numbers that are the
# sum of 3 consecutive digits between 1,000 and 2,000
# 1110 = the mean of all the numbers 
# (sum the nums and divide by amnt)
# 12555, the sum of all the found sums

# given a maxSum and nMax
# create an array of all nums between 1 and maxSum
# split the array into subarrys of 3 consecutive numbers
# select only the subarrays where the sum is between 1,000 and 2,000
require 'pry'

def max_sumDig(num, max_sum)
    nums = (1000..num).select do |num| 
        num_sum = num.digits.map(&:to_i).reduce(&:+)
        num_sum <= max_sum
    end
    mean = nums.reduce(&:+) / nums.size
    diff = nums.map { |num| (mean - num).abs }
    binding.pry
    index_of_diff = diff.index(diff.min)
    # binding.pry
    [nums.size, nums[index_of_diff] ,(nums.reduce(&:+)) ]
end 

# p max_sumDig(2000, 3)
# p max_sumDig(2000, 4) #-----> [21, 1120, 23665]
p max_sumDig(5000, 6) #== [122, 2010, 244875] # I got [122, 2004, 244875]