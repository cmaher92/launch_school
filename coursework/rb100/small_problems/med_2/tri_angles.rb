# A triangle is classified as follows:
#
# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees,
# and all angles must be greater than 0: if either of these conditions is not
# satisfied, the triangle is invalid.
#
# Write a method that takes the 3 angles of a triangle as arguments,
# and returns a symbol :right, :acute, :obtuse, or :invalid depending
# on whether the triangle is a right, acute, obtuse, or invalid triangle.
#
# You may assume integer valued angles so you don't have to worry about
# floating point errors. You may also assume that the arguments are specified
# in degrees.

# input
# 3 integers
# output
# symbol representing the type of triangle
# rules
#   :right  - 1 angle of the triangle is 90º
#   :acute  - 3 angles of triangle are less than 90º
#   :obtuse - 1 angle is greater than 90º
#   :invalid - sum is not equal to 180º
#   :invalid - sum is not > 0

# place the angles into an array
# in case sum is not equal to 180 or sum is not > 0 return invalid
# check to see if there is a 90 within the array, return :right
# check to see if there is an angle > 90 in the array, return :obtuse
# check to see if all angles < 90, return :acute

def triangle(l1, l2, l3)
  lengths = [l1, l2, l3]
  case
  when lengths.any? { |length| length == 0 } then return :invalid
  when lengths.reduce(:+) < 180 || lengths.reduce(:+) <= 0 then return :invalid
  when lengths.include?(90) then return :right
  when lengths.any? { |length| length > 90 } then return :obtuse
  when lengths.all? { |length| length < 90 } then return :acute
  end
end


# Examples:
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
