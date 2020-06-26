# When the go_fast method is called from an instance of Car class
# you might have noticed that the string printed when we go fast 
# includes the name of the tye of vehicle we are using

module Speed
  def go_fast
    puts "I am a #{self.cass} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

