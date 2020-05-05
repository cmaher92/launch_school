# Tri-angles
# medium 2, problem 6

# A triangle is classified as follows:
# right– one angle of the triangle is a right angle (90 degrees)
# acute– all 3 angles of the triangle are less than 90 degrees
# obtuse– one angle is greater than 90 degrees

# To be valid, the sum of the anglus must be exactly 180 degrees
# all angles must be greater than 0
# The triangle is invalid if either of these conditions isn't satisfied

# Write a method that takes the 3 angles of a triangle as arguments, and returns
# a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle
# is a right, acute, obtuse, or invalid triangle

# You may assume integer valued angles so you don't have to worry about floating point
# errors. You may also assume that the arguments are specified in degrees.

# Input: 3 integers
# output: symbol
# Rules: 
# - must be exactly 180 degrees (angles summed)
# - all angles must be greater than 0
# - right– one angle of the triangle is a right angle (90 degrees)
# - acute– all 3 angles of the triangle are less than 90 degrees
# - obtuse– one angle is greater than 90 degrees

# algorithm
# - return :invalid if angles summed are not 180, or not all are more than 0

def triangle(*angles)
  return :invalid if angles.sum != 180 || angles.any? { |angle| angle == 0 }
  case
  when angles.any? { |angle| angle == 90 } then :right
  when angles.all? { |angle| angle < 90 }  then :acute
  when angles.any? { |angle| angle > 90 }  then :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
