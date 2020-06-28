# Question 2
# Ben and Alyssa are working on a vehicle management system. 
# So far, they have created classes called Auto and Motorcycle to represent 
# automobiles and motorcycles. After having noticed common information 
# and calculations they were performing for each type of vehicle, they decided to 
# break out the commonality into a separate class called WheeledVehicle. 
# This is what their code looks like so far:

module Moveable
    attr_accessor :speed, :heading
    attr_writer :fuel_capacity, :fuel_efficiency
  
    def range
    @fuel_capacity * @fuel_efficiency
    end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
     
  def to_s
    "with a range of #{self.range} kilometers"
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
  
  def to_s
    "This is an #{self.class} " + super
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
  
  def to_s
    "This is a #{self.class} " + super
  end
end

class Seacraft
  include Moveable

  attr_reader :hull_count, :propeller_count

  def initialize(num_propellers, num_hulls, fuel_efficiency, fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = fuel_efficiency
    self.fuel_capacity = fuel_capacity
  end
  
  def range
    super + 10
  end
end

class Motorboat < Seacraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

class Catamaran < Seacraft
end

car = Auto.new
puts car

bike = Motorcycle.new
puts bike