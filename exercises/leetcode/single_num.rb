# single num
# leetcode
# https://leetcode.com/problems/single-number/submissions/

# @param {Integer[]} nums
# @return {Integer}

# iterate over all the elements in nums
# if some number in nums is new to array, append it
# if some number is already in array, remove it

def single_number(nums)
  hash_table = {}
  nums.each do |num|
    if hash_table[num].nil?
      hash_table[num] = 1
    else
      hash_table.delete(num)
    end
  end
  hash_table.keys[0]
end

p single_number([2, 2, 1])
