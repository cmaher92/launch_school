module SteeringWheel
end

class NewCar
  attr_accessor :make, :model
  def initialize(make, model)
    @make = make
    @model = model
  end
  
  def change_info(make, model)
    self.make = make
    self.model = model
  end
  
  def honk
     # here the make and model getter methods are called
    # it's better to use getter methods than access the ivars directly
      "The #{self.make} #{self.model} beeps!"
  end
end

car = NewCar.new('Audi', 'Q5')
puts car.make
puts car.model
car.change_info('Audi', 'SQ5')
puts car.make
puts car.model