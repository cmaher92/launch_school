# Grade book
# easy_9, problem 10

# < Integer
# < Integer
# < Integer
# > String
# ! determines the mean of the three scores passed to it
#   and returns the letter balue associated with that
#   grade
# ! 90..100 -> 'A'
# ! 80...90 -> 'B'
# ! 70...80 -> 'C'
# ! 60...70 -> 'D'
# ! 0...60  -> 'F'
# ! assume all numbers are between 0 and 100
# & 
#   find the average of the numbers
#     - the argument should use the splat operator which turns the input into an array
#     - reduce the array and dive by the count as a float
#   map the number_avg to a grade
#     - case statement

def get_grade(*grades)
  case grades.reduce(:+) / grades.size
  when 90..1000 then 'A'
  when 80...90 then  'B'
  when 70...80 then  'C'
  when 60...70 then  'D'
  else               'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
