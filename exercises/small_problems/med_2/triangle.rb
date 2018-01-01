# Triangle Sides
# A triangle is classified as follows:
#
# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must
# be greater than the length of the longest side, and all sides must have
# lengths greater than 0: if either of these conditions is not satisfied,
# the triangle is invalid.
#
# Write a method that takes the lengths of the 3 sides of a triangle as
# arguments, and returns a symbol :equilateral, :isosceles, :scalene,
# or :invalid depending on whether the triangle is
# equilateral, isosceles, scalene, or invalid.

=begin
input
  3 integers
output
  symbol - :equilateral, :isosceles, :invalid, :scalene
rules
  equilateral - 3 sides equal
  isosceles   - 2 sides equal
  scalene     - 3 different lengths
  invalid     - 2 shortest sides summed must be longer then longest side
  invalid     - all sides summed must be greater than 0

place each length into an array of lengths which can be worked with
order the array from least to greatest
if 1st and 2nd element of the ordered_arr is not longer than the lest
  return :invalid
if all elements sum are not greater than 0
  return :invalid
if arr's length after removing repeated elements is 1
  return :equilateral
if arr's length is 2 after removing repeated elements
  return :isosceles
if arr's length is 3 after removing repeated elements
  return :scalene

=end
def triangle(l1, l2, l3)
  lengths = [l1, l2, l3].sort
  case
  when lengths[0] + lengths[1] <= lengths[-1] then return :invalid
  when lengths.reduce(:+) <= 0 then return :invalid
  when lengths.uniq.size == 1 then return :equilateral
  when lengths.uniq.size == 2 then return :isosceles
  when lengths.uniq.size == 3 then return :scalene
  end
end

# Examples:
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
