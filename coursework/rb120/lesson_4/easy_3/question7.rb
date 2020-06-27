# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness, @color = brightness, color
  end

  def self.information
    "I want to turn on the light with a brightness level really high"
  end
end
