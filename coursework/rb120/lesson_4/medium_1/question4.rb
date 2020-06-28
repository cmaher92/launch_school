# question 4

# create a class called greeting with a single instance method
# called greet that takes a string argument and prints that argument
# to the terminal

class Greeting
  def greet(str)
    puts str
  end
end

class Hello < Greeting
  def hi
    greet "Hello"
  end
end

class Goodbye < Greeting
  def bye
    greet "Goodbye"
  end
end

Greeting.new.greet('hi')
Hello.new.hi
Goodbye.new.bye