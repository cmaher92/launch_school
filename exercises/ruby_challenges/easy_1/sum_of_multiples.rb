require 'pry'

class SumOfMultiples
  DEFAULT = [3, 5]
  
  def initialize(*numbers)
    @numbers = numbers
  end
  
  def to(int)
    (0...int).select do |n|
      @numbers.any? { |number| n % number == 0 }
    end.sum
  end
  
  def self.to(int)
    (0...int).select do |n|
      DEFAULT.any? { |d| n % d == 0 }
    end.sum
  end
end

# p SumOfMultiples.new.to(100)
# p SumOfMultiples.new(7, 13, 17).to(20)