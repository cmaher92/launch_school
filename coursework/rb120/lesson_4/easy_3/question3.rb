# question 3
# when objects are created they are a separate realization
# of a particular class
# given the following code, create two instances with unique names and ages

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

sky = AngryCat.new(22, 'skylar') # :)
connor = AngryCat.new(28, 'connor')
connor.name; sky.name
