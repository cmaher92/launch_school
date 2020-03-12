[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# Line, Action, Object, Side-Effect, Return Value, Is Return Value Used?
# 1, method call (map), [[1, 2], [3, 4]], none, transformed array, no, shown
#     on line 6
# 2-5 block execution, each sub-array, [[2, 4], [6, 8]], yes used by top-level map
#    for transformation
# 2, method (map), each sub-array, none, each transformed sub-array, yes by the
#   outer block execution,
# 2-4, block execution, each number within sub-array, none, an integer, yes by
#    inner block as return value
#  3, num * 2, n/a, none, an integer, yes, used to determine value of inner-block

# outputs
# [[2, 4], [6, 8]]
