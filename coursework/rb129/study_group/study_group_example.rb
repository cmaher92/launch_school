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
