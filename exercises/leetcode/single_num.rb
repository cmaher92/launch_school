# single num
# leetcode
# https://leetcode.com/problems/single-number/submissions/

def single_number(nums)
    nums.select { |num| nums.count(num) == 1}[0]
end
