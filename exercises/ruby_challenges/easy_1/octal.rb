# input
# - decimal input string
# output
# - decimal output
# rules
# - conversion must be done manually
# algorithm
# - given a decimal input string
# - iterate over each character in reverse
# - 

class Octal
  def initialize(str)
    @octal = str
  end
  
  def to_decimal
    total = 0
    power = 0
    @octal.reverse.each_char do |char|
      return 0 if /[a-zA-z8-9]/.match? char 
        total += (char.to_i * (8**power))
        power += 1
    end
    total
  end
end

# p Octal.new('130').to_decimal
# p Octal.new('1').to_decimal