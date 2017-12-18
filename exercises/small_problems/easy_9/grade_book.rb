# Grade book

# Write a method that determines the mean (average) of the three scores passed 
# to it, and returns the letter value associated with that grade.

# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'

# Tested values are all between 0 and 100. There is no need to check for 
# negative values or values greater than 100.

# input
#  3 integers representing grades
# output
#  string, representing the grade once averaged and mapped to it's letter grade

# define a hash of ranges with the values of each range the associated letter 
# grade
# given three integers
# place into array, sum together and divide by 3
# map to hash representing grades
#   find the key for the average
#   return the value for the key

GRADES = { 
  (90..100) => "A", 
  (80...90) => "B", 
  (70...80) => "C", 
  (60...70) => "D",
  (0...60)  => "F"
}

def get_grade(a, b, c)
  avg = [a, b, c].reduce(:+) / 3
  key = GRADES.keys.find { |range| range.include?(avg) }
  p GRADES[key]
end

# Example:
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"