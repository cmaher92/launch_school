class Person
  @@number_of_people = 0
  def test
    puts @@number_of_people
  end

  def self.test
    puts @@number_of_people
  end
end

Person.test
Person.new.test
