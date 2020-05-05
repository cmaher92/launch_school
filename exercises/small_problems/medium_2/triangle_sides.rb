# Triangle Sides
# Medium 2, problem 5

# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be 
# greater than the length of the longest side, and all sides must have lengths greater than 0: 
# if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, 
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid 
# depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# Input: 3 Integers
# Output: symbol
# Rules:
# - the sum of the length of the two shortest sides must be greater than the length of the longest side
# - all sides must have lengths greater than 0
# - equilateral, all 3 sides are of equal length
# - isoceles, 2 sides are of equal length while 3rd side is different
# - scalene, all sides different length

# return :invalid if sides include a 0, or first two elements aren't greater than last
# 

def triangle(*sides)
  sides = sides.sort
  return :invalid if sides[0..1].sum <= sides[-1]
  unique_sides = sides.map(&:to_s).uniq.size
  case
  when unique_sides == 3 then return :scalene
  when unique_sides == 2 then return :isosceles
  when unique_sides == 1 then return :equilateral
  end
end

# Examples:
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
