# question 4
# given the class below, if we created a new instance of the class and then
# called to_s on that instance we could get #<Cat:0x000asdf0a963fa> (or something similar)

# how could we go about changing the to_s to output on this method to look like this:
# => I am a tabby cat

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat" # although this should probably be defined as display_type instead of overriding to_s
  end
end

puts Cat.new('tabby')
