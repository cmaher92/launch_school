# What is the return value of Computer.ports on line 14

class Computer
  @@ports = 2
  def self.ports
    @@ports
  end
end

class Phone < Computer
  @@ports = 1
end

p Computer.ports
