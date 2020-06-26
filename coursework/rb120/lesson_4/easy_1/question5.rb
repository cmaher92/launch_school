# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# answer
# The pizza class because an instance variable is defined with a single '@' symbol
# Or, use the instance method #instance_variables

p Pizza.new.instance_variables
p Fruit.new.instance_variables
  