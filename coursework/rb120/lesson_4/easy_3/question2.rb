# question 2
# In the last question we had the following classes:
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    puts "hi"
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# How can we make a call to the Hello class method hi work?
Hello.hi
