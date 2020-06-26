# Question 2
# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:
trip = RoadTrip.new
puts trip.predict_the_future

# - #predict_the_future is invoked on an instance of RoadTrip
# - Ruby searches RoadTrip for #predict_the_future and doesn't find it
# - Ruby moves up the method lookup path
