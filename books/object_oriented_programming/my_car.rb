module Gas
   def gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

class Vehicle
  @@number_of_objects = 0
  attr_accessor :color, :speed
  attr_reader :year, :model
  def initialize(year, color, model)
    @@number_of_objects += 1
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def self.number_of_objects
    puts "This program has created #{@@number_of_objects} vehicles"
  end

  def speed_up(speed_increase)
    self.speed += speed_increase
    puts "Your speed is now #{self.speed}"
  end
  
  def brake(speed_decrease)
    self.speed -= speed_decrease
    puts "Your speed is now #{self.speed}"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
  
  def shut_off
    self.speed = 0
    puts 'The vehicle is now off'
  end

  def to_s
    "This is a #{self.year} #{self.color} #{self.model}"
  end

  def age
    puts "Your #{self.model} is #{age_of_vehicle} years old"
  end

  private

  def age_of_vehicle
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  include Gas
  
  def initialize(year, color, model)
    super(year, color, model)
  end

  def doors
    NUMBER_OF_DOORS
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  include Gas

  def initialize(year, color, model)
    super(year, color, model)
  end

  def doors
    NUMBER_OF_DOORS
  end
end

car = MyCar.new(2014, 'black', 'audi')
truck = MyTruck.new(2020, 'silver', 'toyota')
puts car.doors
puts truck.doors
car.age
truck.age
