# question 7
# how could you change the method name below so that it is 
# more clear and less repetitive?

class Light
  attr_accessor :brightness, :color
  
  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end
  
  def self.information
    "its a cool light"
  end
end