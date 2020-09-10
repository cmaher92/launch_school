class Trinary
  attr_accessor :trinary
  BASE = 3
  INVALID = /\D|[3-9]/
  
  
  def initialize(trinary_str)
    self.trinary = trinary_str.reverse.split(//)
  end
  
  def to_decimal
    power = 0
    trinary.each_with_object([]) do |char, arr|
      return 0 if INVALID.match? char
      arr << (char.to_i * (BASE**power))
      power += 1
    end.reduce(:+)
  end
end

# p Trinary.new('102012').to_decimal