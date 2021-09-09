# double_double_ls.rb
# instructor solution

def twice(n)
  str_n = n.to_s
  center = str_n.size / 2
  left_side = center.zero? ? '' : str_n[0...center]
  right_side = str_n[center..-1]

  left_side == right_side ? n : n * 2
end


=begin
Observations:
- This solution doesn't check the size of the string
  - divides the str's size by two regardless of the size
  - if the quotient is 0, it assigns the left_side to an empty string

1. '22'
2. '22'.size / 2
3. center in this case is 0
4. left_side is now ''
5. right side is '22'[0..-1] which of course is '22'
6. left and right are compared, returns false, n * 2 is returned
=end