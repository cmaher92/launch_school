class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
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
    puts "Your new #{color} paint job looks great!"
  end

  def to_s
    "This car is a #{self.year} #{self.color} #{self.model}"
  end
  
end
