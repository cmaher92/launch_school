# next bigger number

=begin
Create a function that takes a positive integer and returns 
the next bigger number that can be formed by rearranging its digits. For example:

12 ==> 21
513 ==> 531
2017 ==> 2071

nextBigger(num: 12)   // returns 21
nextBigger(num: 513)  // returns 531
nextBigger(num: 2017) // returns 2071

If the digits can't be rearranged to form a bigger number, return -1 (or nil in Swift):
9 ==> -1
111 ==> -1
531 ==> -1
=end

# input:
#   - Integer
# output:
#   - Integer of next biggest number, or -1 if can't arrange differently
# constraints:
#   - positive integer
#   - only consider arrangements that are larger than input
# test input/output
#   - 12 -> [12, 21] -> 21
#   - 531 -> [135, 153, 315, 351, 513, 531] -> -1
#   - 111 -> [111, 111, 111, 111, 111, 111] -> -1
#   - 9 -> [9] -> -1
# algorithm/data structure:
# - find all combinations the length of the number



p next_bigger(144)
p next_bigger(2017)
p next_bigger(111)
p next_bigger(9)
p next_bigger(531)
p next_bigger(12)
