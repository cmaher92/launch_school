=begin
Stack machine interpretation

Write a class that implements a miniature stack-and-register-based programming
language that has the following commands:

- n Place a value n in the "register". Do not modify the stack.
- PUSH Push the register value on to the stack. Leave the value in the register.
- ADD Pops a value from the stack and adds it to the register value, storing the
  result in the register.
- SUB Pops a value from the stack and subtracts it from the register value,
  storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value,
  storing the result in the register.
DIV Pops a value from the stack and divides it into the register value,
  storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value,
  storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value

- All operations are integer operations
  (which is only important with DIV and MOD).

- Programs will be supplied to your language method via a string passed
  in as an argument. Your program should produce an error if an unexpected
  item is present in the string, or if a required stack value is not on the
  stack when it should be (the stack is empty). In all error cases, no further
  processing should be performed on the program.

You should initialize the register to 0.
=end
require 'pry'

class ValidateInstructionsError < StandardError; end
class UnexpectedStackValueError < StandardError; end

class Minilang
  VALID_METHODS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  def initialize(instructions)
    @register = 0
    @stack = Stack.new
    @instructions = parse(instructions)
  end

  def eval
    @instructions.each do |instruction|
      begin
        execute(instruction)
      rescue UnexpectedStackValueError => e
        puts e
        break
      end
    end
  end

  private

  def n(instruction)
    @register = instruction.to_i
  end

  def print
    puts @register
  end

  def push
    @stack.push(@register)
  end

  def add
    @register += pop
  end

  def sub
    @register -= pop
  end

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register = @register % pop
  end

  def pop
    @register = @stack.pop
  end

  def execute(instruction)
    if n?(instruction)
      self.send :n, instruction
    else
      self.send instruction.downcase.to_sym
    end
  end

  def parse(instructions)
    instructions = instructions.split(' ')
    validated_instructions = []
    instructions.each do |instruction|
      begin
        validate(instruction)
        validated_instructions << instruction
      rescue ValidateInstructionsError => e
        puts e
        break
      end
    end
    validated_instructions
  end

  def validate(instruction)
    unless VALID_METHODS.include?(instruction) || n?(instruction)
      raise ValidateInstructionsError, "Invalid token:'#{instruction}'."
    end
  end

  def n?(instruction)
    instruction.to_i.to_s == instruction
  end
end

class Stack
  def initialize
    @stack = []
  end

  def push(value)
    validate(value)
    @stack.push(value)
  end

  def pop
    validate_stack_populated
    @stack.pop
  end

  private

  def validate_stack_populated
    raise UnexpectedStackValueError, "Stack is empty!" if @stack.empty?
  end

  def validate(value)
    if value.to_s.to_i != value
      raise UnexpectedStackValueError, "#{value} is not an integer."
    end
  end
end

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)p
