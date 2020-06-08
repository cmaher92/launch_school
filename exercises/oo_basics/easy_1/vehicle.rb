class Vehicle
  @@wheels = 4
  attr_reader :make, :model
  def initialize(make, model)
    @make = make
    @model = model
  end

  def self.number_of_wheels
    @@wheels
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle

  def initialize(make, model)
    super
  end
end

class Motorcycle < Vehicle

  def initialize(make, model)
    @make = make
    @model = model
    @@wheels = 2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
    @@wheels = 6
  end
end

truck = Truck.new('toyota', 'tacoma', 2000)
puts truck
puts Truck.number_of_wheels
car   = Car.new('toyota', 'camry')
puts car
puts Car.number_of_wheels
bike  = Motorcycle.new('toyota', 'fast-bike')
puts bike
puts Car.number_of_wheels
