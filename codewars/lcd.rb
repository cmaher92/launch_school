# def find_lcm(arr)
#     lcm = 1
#     loop do
#       # creates an array of booleans based on if the lcm
#       # can be evenly divided be each denominator
#       results = arr.map do |denom|
#         lcm % denom == 0
#       end
#       # once the lcm is found (all booleans in the arr)
#       # break the loop
#       break if results.all? { |b| b == true }
#       lcm += 1
#     end
#   lcm
# end
#
# def convert_fracts(arr)
#   denominators = []
#
#   arr.each do |subarr|
#     denominators << subarr[1]
#   end
#
#   lcm = find_lcm(denominators)
#
#   # map each fraction in the arr
#     # the first element (numerator) * (lcm / denominator)
#   # return [result, lcm]
#   arr.map do |fraction|
#     result = fraction[0] * (lcm / fraction[1])
#     [result, lcm]
#   end
# end

def convert_fracts(lst)
  lcm = lst.reduce(1) { |x,y| x.lcm(y[1]) }
  lst.map { |x| [lcm/x[1]*x[0], lcm] }
end

p convert_fracts([[1, 2], [1, 3], [1, 4]]) # [6, 12], [4, 12], [3, 12]
