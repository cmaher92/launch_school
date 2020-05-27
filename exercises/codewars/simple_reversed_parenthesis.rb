# Simple reversed parenthesis

=begin
Given a string, return the minimal number of parenthesis reversals needed to make balanced parenthesis.

For example:

solve(")(") = 2 Because we need to reverse ")" to "(" and "(" to ")". These are 2 reversals. 
solve("(((())") = 1 We need to reverse just one "(" parenthesis to make it balanced.
solve("(((") = -1 Not possible to form balanced parenthesis. Return -1.
Parenthesis will be either "(" or ")".

More examples in the test cases.

Good luck.
=end

# input:
#   - String
# output:
#   - Intger– minimal number of parenthesis reversals needed to make balanced parenthesis
# rules/constraints:
#   - return -1 if impossible
#   - if not even number of parenthesis, return -1
#   - reversal is when you switch a '(' to a ')' or ')' to a '('
# test input/output
#   -
# algorithm/data structure:
#   - return -1 if length is odd
#   - iterate over parenthesis
#   - set o, c and t to 0
#   - if '(' +1 to o
#   - if ')' +1 to c
#   - if c > 0
#     - -1 to c
#     - +1 to o
#     - +1 to t
#   - find difference between open and closed
#     - subtract closed from open
#   - divide difference by 2 and add to t

def solve(str)
  return -1 if str.length.odd?
  o, c, t = [0, 0, 0]
  
  str.each_char do |p|
    if p == '('
      o += 1
    else
      c += 1
      if c > o
        o += 1
        c -= 1
        t += 1
      end
    end
  end
  
  if o > c
    t += (o - c) / 2
  end
  t
end

p solve(")()(") == 2
# c -> o = 0, c = 1 # REVERSE o = 1, c = 0
# o -> o = 2, c = 0
# c -> o = 2, c = 1
# o -> o = 3, c = 1
# --- end of iteration ---
# c = 1, o = 3 # REVERSE, c + 1, o - 1
# c = 2, o = 2
# EVEN
# 2 total reverses

p solve("((()") == 1
# o -> o = 1, c = 0
# o -> o = 2, c = 0
# o -> o = 3, c = 0
# c -> o = 3, c = 1
# --- end of iteration
# REVERSE
# 1 total reverse


p solve("(((") == -1
# o -> o = 1, c = 0
# o -> o = 2, c = 0
# o -> o = 3, c = 0
# --- end of iteration
# -1, total open and closed is odd

p solve("())(((") == 3
# o -> o = 1, c = 0
# c -> o = 1, c = 1
# c -> o = 1, c = 2 # REVERSE o = 2, c = 1
# o -> o = 3, c = 1
# o -> o = 4, c = 1
# o -> o = 5, c = 1
# --- end of iteration
# difference is 4
# half of difference is 2, +2 to REVERSE

p solve("())()))))()()(") == 4
# o -> o = 1, c = 0
# c -> o = 1, c = 1
# c -> o = 2, c = 1 # REVERSE
# o -> o = 3, c = 1
# c -> o = 3, c = 2
# c -> o = 3, c = 3
# c -> o = 4, c = 3 # REVERSE
# c -> o = 4, c = 4
# c -> o = 5, c = 4 # REVERSE
# o -> o = 6, c = 4
# c -> o = 6, c = 5
# o -> o = 7, c = 5
# c -> o = 7, c = 6
# o -> o = 8, c = 6
# --- end of iteration
# difference is 2
# half of difference is 1, so +1 Reverse
# total of 4
