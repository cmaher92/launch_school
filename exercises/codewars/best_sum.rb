def choose_best_sum(t, k, ls)
#     input
#       ls - arr, distances
#       t  - int, total number of miles willing to drive
#       k  - int, number of towns to visit
#     result
#       nil - if there isn't enough towns to visit
#       int - highest sum of the distance between three towns that is also under t
      
#       find the combinations of ls by (k)
#       now map each subarray as a reduce sum, unless it's over t then remove it
#       now return the max sum

require 'pry'
  return nil if ls.size < 3
  options = ls.combination(k).to_a
  binding.pry
  options.map! { |subarr| subarr.reduce(:+) }
  options.map! { |sum| sum <= t }
  options.max
end

ts = [50, 55, 56, 57, 58]
p choose_best_sum(163, 3, ts)