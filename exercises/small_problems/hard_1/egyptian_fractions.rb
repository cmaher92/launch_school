# Egyption Fractions

# rational number is any number that can be represented as the result of the division between two 
# integers, e.g., 1/3, 3/2, 22/7, etc. The number on the left is the numerator, the number on the right
# is the denominator

# A unit fraction is a rational number where the numerator is 1. 

# An egyption fraction is the sum of a series of distinct unit fractions (no two are the same).

# egyption method
# - takes a rational number as an argument
# - returns an array of the denominators
# - denominators represent part of an egyption fraction representation of the number

#######

# given a rational number
# create an array comprised of denominators
# keep a denominator variable to access while looping
# keep the sum to access while looping
# loop until the sum is equivalent to the given rational number (n)
#   - add the sum to a new rational number of 1/denominator
#   - if the sum is less than or equal to the rational number
#     - add denominator to array
#     - update sum variable
#   - incremement denominator
# return the denominators array

def egyption(n)
  denonimators = []
  denominator = 1
  sum = 0
 until sum == n
    if sum + Rational(1, denomator) <= n
      
    end
  end
end

egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
egyptian(-2, 1) -> # false



# and another takes an array of numbers in the same format
# and calculates the resulting rational number
# you will need to use the Rational class provided by Ruby

