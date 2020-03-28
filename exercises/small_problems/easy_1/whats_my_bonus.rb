# Whats my Bonus?
# Write a method that takes two arguments, a positive integer and a boolean, 
# and calculates the bonus for a given salary. 
# If the boolean is true, the bonus should be half of the salary. 
# If the boolean is false, the bonus should be 0.

# - Input:
#   - Integer: positive
#   - Boolean:
#     - true: half of salary
#     - false: 0
# - Output:
#   - Integer
# - Rules:


# - Data Structure:
#   - Integer; based on the flag just need to simple return 0 or half of the inputted integer
# - Algorithm:
#   - ternary if statement based on the flag
#     - if true, return half the salary
#     - false, return 0

def calculate_bonus(sal, bonus_eligible)
  bonus_eligible ? (sal / 2) : 0
end

# - Tests:
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000