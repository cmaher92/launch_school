class Person
  def initialize(name)
    @name = name
  end

  def get_name
    @name      # is the instance variable @name accessible from this method's scope?
  end
end
