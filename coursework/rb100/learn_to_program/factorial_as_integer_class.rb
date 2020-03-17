# Factoral as integer class
# The goal here is to modify the Integer class to include the class method factorial
# Factorial is the product of an integer and all the integers below it
# factorial four ( 4! ) = 24
# 4 * 3 * 2 * 1

class Integer
  def factorial
    current_factorial = [1, 2]
    product = current_factorial.inject(:*)
      while product != self
        if current_factorial.last > self
          return "#{self} does not have a factorial"
        else
          current_factorial << current_factorial.last + 1
          product = current_factorial.inject(:*)
        end
      end
      return current_factorial.join('*')
  end
end

puts 24.factorial
