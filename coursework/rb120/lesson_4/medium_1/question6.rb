# question 6

# if we had these two methods

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and these two methods

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# what is the difference in the way the code works?
# both classes use attr_accessor's to define setters and getters
# the first #create_template method then references the instance variable directly
# the second #create_template uses the setter method to set the instance variable

# show_template
# - the first Computer class references the getter method
# - the second also references the getter method, but does so while explicitly referencing the
#   the object