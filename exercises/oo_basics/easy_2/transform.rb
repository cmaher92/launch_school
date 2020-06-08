class Transform
  attr_reader :text
  def initialize(text)
    @text = text
  end

  def lowercase
    text.downcase
  end

  def uppercase
    text.upcase
  end

  def self.lowercase(text)
    text.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.lowercase
puts my_data.uppercase
puts Transform.lowercase('XYZ')
