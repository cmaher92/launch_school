# What happens when you try to reference an instance
# variable that was initialized as the class level?

class Person
  @name = 'bob'

  def get_name
    @name
  end
end

bob = Person.new
p bob.get_name
