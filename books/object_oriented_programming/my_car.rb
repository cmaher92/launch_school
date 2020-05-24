class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end
  
  def speed_up(speed_increase)
    self.speed += speed_increase
    puts "Your speed is now #{self.speed}"
  end
  
  def brake(speed_decrease)
    self.speed -= speed_decrease
    puts "Your speed is now #{self.speed}"
  end
  
  def shut_off
    self.speed = 0
    puts 'The car is now off'
  end
  
  def spray_paint(color)
    self.color = color
  end
  
end

car = MyCar.new('2020', 'black', 'Audi')
puts car.year
puts car.model
puts car.color
puts car.speed
car.speed_up(10)
car.shut_off
puts car.speed