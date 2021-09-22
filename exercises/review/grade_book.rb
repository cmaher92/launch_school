# grade_book.rb

# IO
# < int, int, int
# > GRADE (str)

# RULES
# - take the average of the three scores passed to it

# ALGORITHM
# - find the average (mean)
# - CASE avg
#   - compare each grade range to return the associated letter-grade

def get_grade(*grades)
  mean = grades.sum / grades.size

  case mean
  when (90..) then 'A'
  when (80...90) then 'B'
  when (70...80) then 'C'
  when (60...70) then 'D'
  when (0...60)  then 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(105, 100, 100)
