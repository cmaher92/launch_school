# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = Reverse the order of the operations in the secret handshake.

class SecretHandshake
  COMMAND = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(number)
    @number = to_binary(number)
  end

  def commands
    commands = []
    @number.digits.each_with_index do |n, i|
      commands.reverse! if i == 4 && n == 1
      commands << COMMAND[i] if n == 1 && i < 4
    end
    commands
  end

  private

  def to_binary(number)
    return number.to_i if number.is_a?(String)
    number.to_s(2).to_i
  end
end

# handshake = SecretHandshake.new 9
# p handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# p handshake.commands # => ["jump","wink"]
