require 'pry'

class NewCar
  def initialize(color, make)
    @color = color 
    @make = make
  end

  def color
    @color
  end

  def color=(color)
    @color = color
  end

  def make
    @make
  end

  def make=(make)
    @make = make
  end

  def change_info(color, make)
    binding.pry
    self.color = color
    self.make  = make
  end

  def info
    "#{self.color} #{self.make}"
  end

  # class method
  def self.what_am_i
    "I am a NewCar method"
  end
end

car = NewCar.new('black', 'audi')

puts car.info
car.change_info('yellow', 'toyota')
puts car.info
puts NewCar.what_am_i
