# question 9
# If we have such a class such as the one below

class Cat
  @@cats_count = 0
  
  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end
  
  def self.cats_count
    @@cats_count
  end
end

# self as demonstrated above refers to the class itself, 
# therefor cats_count can only be called on the class Cat

