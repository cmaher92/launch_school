# question 5
# If i have the following class

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # logic
  end
end

# what would happen if the following method calls were made?
tv = Television.new
tv.manufacturer # NoMethodError
tv.model # this would work

Television.manufacturer # this would work
Television.model # NoMethodError
