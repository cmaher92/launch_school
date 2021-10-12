# exercises from the end of the book

class Vehicle
  @@number_of_instances = 0

  def initialize
    @@number_of_instances += 1
  end

  def self.instances
    puts @@number_of_instances
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end
