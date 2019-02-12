# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}

require 'pry'

def subarrays_div_by_k(a, k)
  # generate list of subarrays from the given array
  subarrays = []  
  x = 0
  until x == (a.size)
    y = x 
    until y == (a.size)
    # binding.pry
      subarrays << a[x..y]
      y += 1
    end
    x += 1
  end
  
  subarrays.map { |arr| arr.reduce(:+) }.select { |num| num % k == 0 }.count

end

a = [4,5,0,-2,-3,1]
k = 5
p subarrays_div_by_k(a,k)