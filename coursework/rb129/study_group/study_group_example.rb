# will the below code run? If not, fix it so it will run.
# What concept does this illustrate?

class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Student < Person
  def initialize(name, age, school)
    super()
    @school = school
  end
end

connor = Student.new('Connor', 28, 'UMass')

# Answer
# It wont, it'll raise an ArgumentError
# - wrong number of arguments (given 0, expected 2) (ArgumentError)
# It demonstrates how super interacts with methods in the method lookup path
# in this case, super is invoked explicity with parenthesis
