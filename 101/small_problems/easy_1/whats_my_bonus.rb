# whats my bonus

# Write a method that takes two arguments, a positive integer and a boolean, 
# and calculates the bonus for a given salary. If the boolean is true, 
# the bonus should be half of the salary. If the boolean is false, the bonus 
# should be 0.

# understanding the problem
# input
#     a positive integer
#     a boolean
# output
#     integer - the bonus for the given salary
# rules
#     if boolean is true, the bonus should be half of the salary
#     if boolean is false, the bonus should be zero
        
# algorithm
#     if earns bonus
#         calculate bonus
#     if doesnt earn bonus
#         return 0
        
# solution
    def calculate_bonus(salary, earn_bonus)
        earn_bonus ? (salary / 2) : 0
    end
    
# test cases
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000