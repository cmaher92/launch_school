# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def subarrays_div_by_k(a, k)
  # generate list of subarrays from the given array
  num_divisible = 0  
  x = 0
  until x == (a.size)
    y = x 
    until y == (a.size)
    # binding.pry
      num_divisible += 1 if a[x..y].reduce(:+) % k == 0
      y += 1
    end
    x += 1
  end
  
  num_divisible
end 