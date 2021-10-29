# vehicles.rb

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @wheels = 4
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    @wheels
  end
end

class Car < Vehicle
  def initialize(make, model)
    super(make, model)
  end
end

class Motorcycle < Vehicle
  def initialize(make, model)
    super(make, model)
    @wheels = 2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
    @wheels = 6
  end
end

moto = Motorcycle.new('Honda', 'lowrider')
puts moto.wheels
